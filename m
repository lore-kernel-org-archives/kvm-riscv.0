From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 18 Aug 2023 09:30:32 +0200
Subject: [PATCH 00/10] RISC-V: Refactor instructions
In-Reply-To: <mhng-7d609dde-ad47-42ed-a47b-6206e719020a@palmer-ri-x1c9a>
References: <ZN5OJO/xOWUjLK2w@ghost>
 <mhng-7d609dde-ad47-42ed-a47b-6206e719020a@palmer-ri-x1c9a>
Message-ID: <20230818-63347af7195b7385c146778d@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 17, 2023 at 10:52:22AM -0700, Palmer Dabbelt wrote:
> On Thu, 17 Aug 2023 09:43:16 PDT (-0700), Charlie Jenkins wrote:
...
> > It seems to me that it will be significantly more challenging to use
> > riscv-opcodes than it would for people to just hand create the macros
> > that they need.
> 
> Ya, riscv-opcodes is pretty custy.  We stopped using it elsewhere ages ago.

Ah, pity I didn't know the history of it or I wouldn't have suggested it,
wasting Charlie's time (sorry, Charlie!). So everywhere that needs
encodings are manually scraping them from the PDFs? Or maybe we can write
our own parser which converts adoc/wavedrom files[1] to Linux C?

[1] https://github.com/riscv/riscv-isa-manual/tree/main/src/images/wavedrom

Thanks,
drew

