From: Palmer Dabbelt <palmerdabbelt@google.com>
Date: Sat, 02 Oct 2021 09:18:02 -0700 (PDT)
Subject: [PATCH v20 00/17] KVM RISC-V Support
In-Reply-To: <CAAhSdy1yZ11L=A3g06GXM8tFtonBX0Cj5NDyGHQ1v44vJ8MqSA@mail.gmail.com>
Message-ID: <mhng-b5a035ae-a545-4c81-a8d9-301c6f7e6982@palmerdabbelt-glaptop>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 27 Sep 2021 04:58:41 PDT (-0700), anup at brainfault.org wrote:
> Hi Palmer, Hi Paolo,
>
> [...]
>
> The RISC-V H-extension is now frozen. Please refer to the latest
> RISC-V privilege specification v1.12 which is in public review.
> https://github.com/riscv/riscv-isa-manual/releases/download/riscv-privileged-20210915-public-review/riscv-privileged-20210915-public-review.pdf
>
> Currently, the RISC-V H-extension is on it's way to being ratified.
> https://wiki.riscv.org/display/TECH/ISA+Extensions+On+Deck+for+Freeze+Milestone
> https://wiki.riscv.org/display/TECH/ISA+Extensions+On+Deck+-+Ready+for+Ratification+Milestone
>
> Here's the announcement on twitter from Mark (CTO, RISC-V International)
> https://twitter.com/mark_riscv/status/1441375977624375296
>
> This means the KVM RISC-V series now satisfies the
> requirements of the Linux RISC-V patch acceptance policy.
>
> Can we consider the KVM RISC-V series for Linux-5.16 ?

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

IIUC the plan here involved a shared tag at some point, with most of 
this going through Paolo's tree.  If you still want me to merge 
something then I'm happy to do so, just make it clear as I've mostly 
lost track of things.

