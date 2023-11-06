From: Sean Christopherson <seanjc@google.com>
Date: Mon, 6 Nov 2023 08:04:17 -0800
Subject: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
In-Reply-To: <CA+EHjTxz-e_JKYTtEjjYJTXmpvizRXe8EUbhY2E7bwFjkkHVFw@mail.gmail.com>
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-28-pbonzini@redhat.com>
 <CA+EHjTxz-e_JKYTtEjjYJTXmpvizRXe8EUbhY2E7bwFjkkHVFw@mail.gmail.com>
Message-ID: <ZUkOgdTMbH40XFGE@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 06, 2023, Fuad Tabba wrote:
> On Sun, Nov 5, 2023 at 4:34?PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > From: Sean Christopherson <seanjc@google.com>
> >
> > Add a "vm_shape" structure to encapsulate the selftests-defined "mode",
> > along with the KVM-defined "type" for use when creating a new VM.  "mode"
> > tracks physical and virtual address properties, as well as the preferred
> > backing memory type, while "type" corresponds to the VM type.
> >
> > Taking the VM type will allow adding tests for KVM_CREATE_GUEST_MEMFD,
> > a.k.a. guest private memory, without needing an entirely separate set of
> > helpers.  Guest private memory is effectively usable only by confidential
> > VM types, and it's expected that x86 will double down and require unique
> > VM types for TDX and SNP guests.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > Message-Id: <20231027182217.3615211-30-seanjc@google.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> 
> nit: as in a prior selftest commit messages, references in the commit
> message to guest _private_ memory. Should these be changed to just
> guest memory?

Hmm, no, "private" is mostly appropriate here.  At this point in time, only x86
supports KVM_CREATE_GUEST_MEMFD, and x86 only supports it for private memory.
And the purpose of letting x86 selftests specify KVM_X86_SW_PROTECTED_VM, i.e.
the reason this patch exists, is purely to get private memory.

Maybe tweak the second paragraph to this?

Taking the VM type will allow adding tests for KVM_CREATE_GUEST_MEMFD
without needing an entirely separate set of helpers.  At this time,
guest_memfd is effectively usable only by confidential VM types in the
form of guest private memory, and it's expected that x86 will double down
and require unique VM types for TDX and SNP guests.

