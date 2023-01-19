From: David Matlack <dmatlack@google.com>
Date: Thu, 19 Jan 2023 11:04:24 -0800
Subject: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common code
In-Reply-To: <CALzav=dya7GsOD7-dm3649Xe4Xo_p5gJACvjZHtpbk0QwoU-gg@mail.gmail.com>
References: <20221208193857.4090582-1-dmatlack@google.com> <Y8l6egh2wWN7BUlZ@google.com>
 <86tu0mmo8m.wl-maz@kernel.org> <CALzav=dya7GsOD7-dm3649Xe4Xo_p5gJACvjZHtpbk0QwoU-gg@mail.gmail.com>
Message-ID: <CALzav=ebYgZu2LfeQkspU_ke6GHbuPcpiST0pMafmAJGziybnA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 19, 2023 at 10:38 AM David Matlack <dmatlack@google.com> wrote:
>
> On Thu, Jan 19, 2023 at 9:24 AM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Thu, 19 Jan 2023 17:14:34 +0000, David Matlack <dmatlack@google.com> wrote:
> > > I'd like to target RISC-V first, since it has significantly lower risk
> > > and complexity than e.g. ARM (which has pKVM, stage-1 walkers, and
> > > [soon] nested virtualization to deal with).
> >
> > And (joy, happiness), the upcoming 128bit page table support[1].
>
> Oh good, I was worried the ARM port was going to be too easy :)

But in all seriousness, I'm not too worried about supporting 128-bit
page tables in the Common MMU, assuming it is a compile-time decision.
The way I'm planning to organize the code, architecture-specific code
will own the PTEs, so each architecture can do whatever they want.
There is a hard-coded assumption that PTEs are u64 in the current
code, but we can abstract that behind a typedef for 128-bit support.

We will need to figure out how to deal with concurrency though. Will
128-bit page table support come with 128-bit atomic support (e.g.
compare-exchange)? If so we should be good to go. If not, we'll need
to emulate them with e.g. spinlocks. But either way, figuring this out
is not specific to the Common MMU. Even if ARM kept its own stage-2
MMU we'd have to solve the same problem there.

