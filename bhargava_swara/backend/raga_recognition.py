import os
import google.generativeai as genai
from flask import Flask, request

app = Flask(__name__)

# Configure your Gemini API key
genai.configure(api_key="YOUR_API_KEY")  # Replace with your actual API key

def analyze_music_gemini(audio_data, file_name):
    """Analyzes music and returns analysis result for Raga only."""
    try:
        model = genai.GenerativeModel("gemini-2.0-flash-thinking-exp-01-21")

        prompt_text = """
        Analyze the musical characteristics of the audio.
        Assume this audio is Indian classical music.
        Identify and extract the following musical element:
        - Raga

        Output the extracted details in the following format:

        -------------------
        EXTRACTED DETAILS

        RAGA :- [Raga Name]
        -------------
        """

        mime_type = "audio/mpeg" if file_name.lower().endswith(".mp3") else "audio/wav"
        contents = [{
            "parts": [
                {"text": prompt_text},
                {"inline_data": {"data": audio_data, "mime_type": mime_type}}
            ]
        }]

        generate_content_config = {
            "temperature": 0.0,
            "top_p": 0.9,
            "top_k": 32,
            "max_output_tokens": 2048,
        }
        safety_settings = [{"category": "HARM_CATEGORY_HARASSMENT", "threshold": "BLOCK_NONE"}]

        response = model.generate_content(
            contents=contents,
            generation_config=generate_content_config,
            safety_settings=safety_settings
        )
        return response.text

    except Exception as e:
        return f"Error during analysis: {str(e)}"

def extract_raga(analysis_result):
    """Extracts the Raga name from the Gemini response."""
    try:
        start_index = analysis_result.find("RAGA :-")
        end_index = analysis_result.find("-------------", start_index)
        if start_index != -1 and end_index != -1:
            raga_part = analysis_result[start_index + 8:end_index].strip()  # Skip "RAGA :- "
            return raga_part
        return "Unknown Raga"
    except Exception:
        return "Error extracting Raga"

@app.route('/analyze-raga', methods=['POST'])
def analyze_raga():
    if 'audio' not in request.files:
        return "No audio file provided", 400

    audio_file = request.files['audio']
    file_path = os.path.join("uploads", audio_file.filename)
    os.makedirs("uploads", exist_ok=True)
    audio_file.save(file_path)

    # Read the audio file as binary data
    with open(file_path, "rb") as f:
        audio_data = f.read()

    # Analyze the audio using Gemini
    analysis_result = analyze_music_gemini(audio_data, audio_file.filename)
    detected_raga = extract_raga(analysis_result)

    # Clean up the uploaded file
    os.remove(file_path)

    return detected_raga

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)