From: Anish Moorthy <amoorthy@google.com>
Date: Wed,  8 Nov 2023 23:37:19 +0000
Subject: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
In-Reply-To: <CAF7b7mrGYuyjyEPAesYzZ6+KDuNAmvRxEonT7JC8NDPsSP+qDA@mail.gmail.com>
References: <CAF7b7mrGYuyjyEPAesYzZ6+KDuNAmvRxEonT7JC8NDPsSP+qDA@mail.gmail.com>
Message-ID: <20231108233723.3380042-1-amoorthy@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 8, 2023 at 9:00?AM Anish Moorthy <amoorthy@google.com> wrote:
>
> This commit breaks the arm64 selftests build btw: looks like a simple oversight?

Yup, fix is a one-liner. Posted below.

diff --git a/tools/testing/selftests/kvm/aarch64/page_fault_test.c b/tools/testing/selftests/kvm/aarch64/page_fault_test.c
index eb4217b7c768..08a5ca5bed56 100644
--- a/tools/testing/selftests/kvm/aarch64/page_fault_test.c
+++ b/tools/testing/selftests/kvm/aarch64/page_fault_test.c
@@ -705,7 +705,7 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 
 	print_test_banner(mode, p);
 
-	vm = ____vm_create(mode);
+	vm = ____vm_create(VM_SHAPE(mode));
 	setup_memslots(vm, p);
 	kvm_vm_elf_load(vm, program_invocation_name);
 	setup_ucall(vm);

