From: David Matlack <dmatlack@google.com>
Date: Mon, 9 Jan 2023 10:55:45 -0800
Subject: [RFC PATCH 10/37] KVM: MMU: Move struct kvm_page_fault to common code
In-Reply-To: <ce1ea196-d854-18bd-0e60-91985ed5aaea@redhat.com>
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-11-dmatlack@google.com>
 <ce1ea196-d854-18bd-0e60-91985ed5aaea@redhat.com>
Message-ID: <CALzav=fVbvKQMhSBD0AdrRTH+jDyRG0Hf5M-H7vCtRCR1Lk9sw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 2:27 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/8/22 20:38, David Matlack wrote:
> > +
> > +     /* Derived from mmu and global state.  */
> > +     const bool is_tdp;
>
> I think this could stay in the architecture-independent part.

I agree but until there's a use case for accessing it in common code
I'm inclined to leave it in x86's kvm_page_fault_arch.

