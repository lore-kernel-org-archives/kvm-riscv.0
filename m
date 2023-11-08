From: Anish Moorthy <amoorthy@google.com>
Date: Wed, 8 Nov 2023 09:00:00 -0800
Subject: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
In-Reply-To: <20231105163040.14904-28-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-28-pbonzini@redhat.com>
Message-ID: <CAF7b7mrGYuyjyEPAesYzZ6+KDuNAmvRxEonT7JC8NDPsSP+qDA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This commit breaks the arm64 selftests build btw: looks like a simple oversight?

$ cd ${LINUX_ROOT}/tools/testing/selftests/kvm
$ CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 make
# ...
aarch64/page_fault_test.c: In function ?run_test?:
aarch64/page_fault_test.c:708:28: error: incompatible type for
argument 1 of ?____vm_create?
  708 |         vm = ____vm_create(mode);
         |                            ^~~~
         |                            |
         |                            enum vm_guest_mode
In file included from include/kvm_util.h:10,
                 from aarch64/page_fault_test.c:14:
include/kvm_util_base.h:806:46: note: expected ?struct vm_shape? but
argument is of type ?enum vm_guest_mode?
  806 | struct kvm_vm *____vm_create(struct vm_shape shape);

