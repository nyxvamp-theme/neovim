// Simple Rust theme with enums
#[derive(Debug, Clone, Copy)]
pub enum Variant {
    Veil,
    Obsidian,
    Radiance,
}

impl Variant {
    fn colors(&self) -> (&'static str, &'static str) {
        match self {
            Variant::Veil => ("#1E1E2E", "#D9E0EE"),
            Variant::Obsidian => ("#000A0F", "#C0C0CE"),
            Variant::Radiance => ("#F7F7FF", "#1E1E2E"),
        }
    }
    
    fn from_str(s: &str) -> Option<Self> {
        match s {
            "veil" => Some(Variant::Veil),
            "obsidian" => Some(Variant::Obsidian),
            "radiance" => Some(Variant::Radiance),
            _ => None,
        }
    }
}

pub fn apply_theme(variant: Variant, transparent: bool) -> String {
    let (bg, fg) = variant.colors();
    let background = if transparent { "none" } else { bg };
    format!("Theme: {:?}, BG: {}, FG: {}", variant, background, fg)
}

// Usage:
// apply_theme(Variant::Veil, false)
// Variant::from_str("obsidian")