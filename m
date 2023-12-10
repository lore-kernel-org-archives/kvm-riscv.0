From: Jim Mattson <jmattson@google.com>
Date: Sun, 10 Dec 2023 14:52:59 -0800
Subject: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
In-Reply-To: <ZXHw7tykubfG04Um@google.com>
References: <20220921003201.1441511-11-seanjc@google.com> <20231207010302.2240506-1-jmattson@google.com>
 <ZXHw7tykubfG04Um@google.com>
Message-ID: <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 7, 2023 at 8:21?AM Sean Christopherson <seanjc@google.com> wrote:
> Doh.  We got the less obvious cases and missed the obvious one.
>
> Ugh, and we also missed a related mess in kvm_guest_apic_has_interrupt().  That
> thing should really be folded into vmx_has_nested_events().
>
> Good gravy.  And vmx_interrupt_blocked() does the wrong thing because that
> specifically checks if L1 interrupts are blocked.
>
> Compile tested only, and definitely needs to be chunked into multiple patches,
> but I think something like this mess?

The proposed patch does not fix the problem. In fact, it messes things
up so much that I don't get any test results back.

Google has an internal K-U-T test that demonstrates the problem. I
will post it soon.

