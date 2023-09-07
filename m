From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 7 Sep 2023 10:51:49 +0200
Subject: [PATCH 00/10] RISC-V: Refactor instructions
In-Reply-To: <ZPjKGd7VstwIKDV5@ghost>
References: <ZN5OJO/xOWUjLK2w@ghost>
 <mhng-7d609dde-ad47-42ed-a47b-6206e719020a@palmer-ri-x1c9a>
 <20230818-63347af7195b7385c146778d@orel>
 <ZPjKGd7VstwIKDV5@ghost>
Message-ID: <20230907-304f53e7de4e0386d04f4dcf@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 06, 2023 at 11:51:05AM -0700, Charlie Jenkins wrote:
> On Fri, Aug 18, 2023 at 09:30:32AM +0200, Andrew Jones wrote:
> > On Thu, Aug 17, 2023 at 10:52:22AM -0700, Palmer Dabbelt wrote:
> > > On Thu, 17 Aug 2023 09:43:16 PDT (-0700), Charlie Jenkins wrote:
> > ...
> > > > It seems to me that it will be significantly more challenging to use
> > > > riscv-opcodes than it would for people to just hand create the macros
> > > > that they need.
> > > 
> > > Ya, riscv-opcodes is pretty custy.  We stopped using it elsewhere ages ago.
> > 
> > Ah, pity I didn't know the history of it or I wouldn't have suggested it,
> > wasting Charlie's time (sorry, Charlie!). So everywhere that needs
> > encodings are manually scraping them from the PDFs? Or maybe we can write
> > our own parser which converts adoc/wavedrom files[1] to Linux C?
> > 
> > [1] https://github.com/riscv/riscv-isa-manual/tree/main/src/images/wavedrom
> 
> The problem with the wavedrom files is that there are no standard for
> how each instruction is identified. The title of of the adoc gives some
> insight and there is generally a funct3 or specific opcode that is
> associated with the instruction but it would be kind of messy to write a
> script to parse that. I think manually constructing the instructions is
> fine. When somebody wants to add a new instruction they probably will
> not need to add very many at a time, so it should be only a couple of
> lines that they will be able to test.
>

OK, we'll just have to prop our eyelids open with toothpicks to get
through the review of the initial mass conversion.

Thanks,
drew

