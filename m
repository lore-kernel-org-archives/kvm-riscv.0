From: Reiji Watanabe <reijiw@google.com>
Date: Wed, 13 Apr 2022 22:00:32 -0700
Subject: [PATCH v5 01/13] KVM: arm64: Don't depend on fallthrough to hide
 SYSTEM_RESET2
In-Reply-To: <20220409184549.1681189-2-oupton@google.com>
References: <20220409184549.1681189-1-oupton@google.com>
 <20220409184549.1681189-2-oupton@google.com>
Message-ID: <CAAeT=FwWB2d-Kea-BQxC--AXZXPSNJh2BoS0_ZMjaKs45rJmeg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 9, 2022 at 11:46 AM Oliver Upton <oupton@google.com> wrote:
>
> Depending on a fallthrough to the default case for hiding SYSTEM_RESET2
> requires that any new case statements clean up the failure path for this
> PSCI call.
>
> Unhitch SYSTEM_RESET2 from the default case by setting val to
> PSCI_RET_NOT_SUPPORTED outside of the switch statement. Apply the
> cleanup to both the PSCI_1_1_FN_SYSTEM_RESET2 and
> PSCI_1_0_FN_PSCI_FEATURES handlers.
>
> No functional change intended.
>
> Signed-off-by: Oliver Upton <oupton@google.com>

Reviewed-by: Reiji Watanabe <reijiw@google.com>

