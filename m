From: David Matlack <dmatlack@google.com>
Date: Wed, 11 Jan 2023 14:45:53 -0800
Subject: [RFC PATCH 04/37] KVM: x86/mmu: Invert sp->tdp_mmu_page to sp->shadow_mmu_page
In-Reply-To: <b0e8eb55-c2ee-ce13-8806-9d0184678984@redhat.com>
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-5-dmatlack@google.com>
 <b0e8eb55-c2ee-ce13-8806-9d0184678984@redhat.com>
Message-ID: <CALzav=eQVLAH2coTU1FaOFstFp-AqQBb0JCycrRcP5qjqfMwEg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 3:15 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/8/22 20:38, David Matlack wrote:
> > Invert the meaning of sp->tdp_mmu_page and rename it accordingly. This
> > allows the TDP MMU code to not care about this field, which will be used
> > in a subsequent commit to move the TDP MMU to common code.
> >
> > No functional change intended.
>
> Let's use a bit of the role instead.

Will do in v2, thanks.

