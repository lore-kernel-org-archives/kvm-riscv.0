From: David Matlack <dmatlack@google.com>
Date: Thu, 19 Jan 2023 10:26:06 -0800
Subject: [PATCH 4/7] KVM: x86/mmu: Rename kvm_flush_remote_tlbs_with_address()
In-Reply-To: <Y8mJQH4VqC76sX7k@google.com>
References: <20230119173559.2517103-1-dmatlack@google.com> <20230119173559.2517103-5-dmatlack@google.com>
 <Y8mJQH4VqC76sX7k@google.com>
Message-ID: <CALzav=fN40q2QCcBuUdTg2z2sJLeRo9u4UCaW5grX5LC-bKqkg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 19, 2023 at 10:17 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Jan 19, 2023, David Matlack wrote:
> > Rename kvm_flush_remote_tlbs_with_address() to
> > kvm_flush_remote_tlbs_range(). This name is shorter, which reduces the
> > number of callsites that need to be broken up across multiple lines, and
> > more readable since it conveys a range of memory is being flushed rather
> > than a single address.
>
> FYI, this conflicts with Hou's series, which I'm in the process of queueing for
> v6.3.
>
> https://lore.kernel.org/all/cover.1665214747.git.houwenlong.hwl at antgroup.com

Ack. I can resend on top of Hou's once it's queued.

