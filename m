From: Reiji Watanabe <reijiw@google.com>
Date: Wed, 13 Apr 2022 22:40:38 -0700
Subject: [PATCH v5 05/13] KVM: Create helper for setting a system event
 exit
In-Reply-To: <20220409184549.1681189-6-oupton@google.com>
References: <20220409184549.1681189-1-oupton@google.com>
 <20220409184549.1681189-6-oupton@google.com>
Message-ID: <CAAeT=FxBMy9jopi5O-L54Rk9AajvwdCSBdNdMozZ_a_OcBB5aA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 9, 2022 at 11:46 AM Oliver Upton <oupton@google.com> wrote:
>
> Create a helper that appropriately configures kvm_run for a system event
> exit.
>
> No functional change intended.
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Oliver Upton <oupton@google.com>
> Acked-by: Anup Patel <anup@brainfault.org>

Reviewed-by: Reiji Watanabe <reijiw@google.com>

