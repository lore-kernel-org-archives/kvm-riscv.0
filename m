From: Reiji Watanabe <reijiw@google.com>
Date: Wed, 23 Feb 2022 22:14:10 -0800
Subject: [PATCH v3 01/19] KVM: arm64: Drop unused param from
 kvm_psci_version()
In-Reply-To: <20220223041844.3984439-2-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
 <20220223041844.3984439-2-oupton@google.com>
Message-ID: <CAAeT=FwgekGA-OjqN5hQeWNY8TS=Vf03GKfgW03sFhFahpgTKw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 22, 2022 at 8:19 PM Oliver Upton <oupton@google.com> wrote:
>
> kvm_psci_version() consumes a pointer to struct kvm in addition to a
> vcpu pointer. Drop the kvm pointer as it is unused. While the comment
> suggests the explicit kvm pointer was useful for calling from hyp, there
> exist no such callsite in hyp.
>
> Signed-off-by: Oliver Upton <oupton@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Reiji Watanabe <reijiw@google.com>

