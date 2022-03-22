From: David Matlack <dmatlack@google.com>
Date: Tue, 22 Mar 2022 11:21:30 -0700
Subject: [PATCH v2 02/26] KVM: x86/mmu: Use a bool for direct
In-Reply-To: <YjBEWm3YsuSKj+ES@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-3-dmatlack@google.com>
 <YjBEWm3YsuSKj+ES@xz-m1.local>
Message-ID: <CALzav=cMFL=ZZyV5uckbhb3RqC0LhOnnooiJGKKN26F69TF63A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 15, 2022 at 12:46 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Mar 11, 2022 at 12:25:04AM +0000, David Matlack wrote:
> > The parameter "direct" can either be true or false, and all of the
> > callers pass in a bool variable or true/false literal, so just use the
> > type bool.
> >
> > No functional change intended.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
>
> If we care about this.. how about convert another one altogether?
>
> TRACE_EVENT(kvm_hv_stimer_expiration,
>         TP_PROTO(int vcpu_id, int timer_index, int direct, int msg_send_result),
>         TP_ARGS(vcpu_id, timer_index, direct, msg_send_result),

My preference would be to keep this commit specific to uses of
"direct" that are related to shadow pages.

The parameter `direct` in trace_kvm_hv_stimer_expiration() looks like
it could be converted as well, but is a different concept altogether
despite having the same variable name.

>
> Thanks,
>
> --
> Peter Xu
>

