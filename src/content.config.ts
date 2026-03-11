import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const dishes = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/dishes' }),
  schema: z.object({
    name: z.string(),
    price: z.number(),
    category: z.string(),
    tags: z.array(z.string()).optional(),
    time: z.string().optional(),
    difficulty: z.enum(['简单', '中等', '困难']).optional(),
    image: z.string().optional(),
    ingredients: z.array(z.string()).optional(),
  }),
});

export const collections = { dishes };
