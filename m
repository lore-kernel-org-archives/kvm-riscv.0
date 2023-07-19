From: Sean Christopherson <seanjc@google.com>
Date: Wed, 19 Jul 2023 07:16:54 -0700
Subject: [RFC PATCH v11 07/29] KVM: Add KVM_EXIT_MEMORY_FAULT exit
In-Reply-To: <20230719075440.m3h653frqggaiusc@yy-desk-7060>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-8-seanjc@google.com>
 <20230719075440.m3h653frqggaiusc@yy-desk-7060>
Message-ID: <ZLfwVki27oLBGO6D@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 19, 2023, Yuan Yao wrote:
> On Tue, Jul 18, 2023 at 04:44:50PM -0700, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> >
> > This new KVM exit allows userspace to handle memory-related errors. It
> > indicates an error happens in KVM at guest memory range [gpa, gpa+size).
> > The flags includes additional information for userspace to handle the
> > error. Currently bit 0 is defined as 'private memory' where '1'
> > indicates error happens due to private memory access and '0' indicates
> > error happens due to shared memory access.
> 
> Now it's bit 3:

Yeah, I need to update (or write) a lot of changelogs.

> #define KVM_MEMORY_EXIT_FLAG_PRIVATE (1ULL << 3)
> 
> I remember some other attributes were introduced in v10 yet:
> 
> #define KVM_MEMORY_ATTRIBUTE_READ              (1ULL << 0)
> #define KVM_MEMORY_ATTRIBUTE_WRITE             (1ULL << 1)
> #define KVM_MEMORY_ATTRIBUTE_EXECUTE           (1ULL << 2)
> #define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> 
> So KVM_MEMORY_EXIT_FLAG_PRIVATE changed to bit 3 due to above things,
> or other reason ? (Sorry I didn't follow v10 too much before).

Yep, I want to reserve space for the RWX bits.

