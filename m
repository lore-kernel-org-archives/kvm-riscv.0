From: Peter Gonda <pgonda@google.com>
Date: Fri, 26 Aug 2022 15:32:30 -0600
Subject: [PATCH v5 0/7] KVM: selftests: Implement ucall "pool" (for SEV)
In-Reply-To: <20220825232522.3997340-1-seanjc@google.com>
References: <20220825232522.3997340-1-seanjc@google.com>
Message-ID: <CAMkAt6ryLh-gQYvmUYfxS3+CRwCLfK3Fby1W5NxxFLSK7M_v0w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 25, 2022 at 5:25 PM Sean Christopherson <seanjc@google.com> wrote:
>
> Non-KVM folks, y'all got pulled in because of the atomic_test_and_set_bit()
> patch.
>
> Rework the ucall infrastructure to use a pool of ucall structs to pass
> memory instead of using the guest's stack.  For confidential VMs with
> encrypted memory, e.g. SEV, the guest's stack "needs" to be private memory
> and so can't be used to communicate with the host.
>
> Convert all implementations to the pool as all of the complexity is hidden
> in common code, and supporting multiple interfaces adds its own kind of
> complexity.
>
> Tested on x86 and ARM, compile tested on s390 and RISC-V.
>

Thanks for the help on the ucall-pool Sean!

I rebased the SEV selftests on these and everything works as before

TESTED-BY: Peter Gonda <pgonda@google.com>

