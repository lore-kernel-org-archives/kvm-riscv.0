From: Marc Zyngier <maz@kernel.org>
Date: Thu, 19 Jan 2023 17:24:25 +0000
Subject: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common code
In-Reply-To: <Y8l6egh2wWN7BUlZ@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
	<Y8l6egh2wWN7BUlZ@google.com>
Message-ID: <86tu0mmo8m.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 19 Jan 2023 17:14:34 +0000,
David Matlack <dmatlack@google.com> wrote:
> 
> On Thu, Dec 08, 2022 at 11:38:20AM -0800, David Matlack wrote:
> > 
> > Hello,
> > 
> > This series refactors the KVM/x86 "TDP MMU" into common code. This is
> > the first step toward sharing TDP (aka Stage-2) page table management
> > code across architectures that support KVM.
> 
> Thank you everyone for the feedback on this RFC. I have a couple of
> updates to share and a question at the end.
> 
> First, Alexandre Ghiti from Rivos is going to work on the RISC-V port.
> I'd like to target RISC-V first, since it has significantly lower risk
> and complexity than e.g. ARM (which has pKVM, stage-1 walkers, and
> [soon] nested virtualization to deal with).

And (joy, happiness), the upcoming 128bit page table support[1].

	M.

[1] https://developer.arm.com/documentation/ddi0601/2022-12/AArch64-Registers/TTBR0-EL1--Translation-Table-Base-Register-0--EL1-?lang=en

-- 
Without deviation from the norm, progress is not possible.

