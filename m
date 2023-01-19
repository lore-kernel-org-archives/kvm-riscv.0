From: David Matlack <dmatlack@google.com>
Date: Thu, 19 Jan 2023 10:38:01 -0800
Subject: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common code
In-Reply-To: <86tu0mmo8m.wl-maz@kernel.org>
References: <20221208193857.4090582-1-dmatlack@google.com> <Y8l6egh2wWN7BUlZ@google.com>
 <86tu0mmo8m.wl-maz@kernel.org>
Message-ID: <CALzav=dya7GsOD7-dm3649Xe4Xo_p5gJACvjZHtpbk0QwoU-gg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 19, 2023 at 9:24 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 19 Jan 2023 17:14:34 +0000, David Matlack <dmatlack@google.com> wrote:
> > I'd like to target RISC-V first, since it has significantly lower risk
> > and complexity than e.g. ARM (which has pKVM, stage-1 walkers, and
> > [soon] nested virtualization to deal with).
>
> And (joy, happiness), the upcoming 128bit page table support[1].

Oh good, I was worried the ARM port was going to be too easy :)

