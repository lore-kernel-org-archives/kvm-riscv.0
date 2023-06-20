From: Yang Li <yang.lee@linux.alibaba.com>
Date: Tue, 20 Jun 2023 08:40:36 +0800
Subject: [PATCH -next] RISC-V: KVM: Remove unneeded semicolon
Message-ID: <20230620004036.4868-1-yang.lee@linux.alibaba.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

./arch/riscv/kvm/aia_imsic.c:94:2-3: Unneeded semicolon
./arch/riscv/kvm/aia_imsic.c:134:2-3: Unneeded semicolon
./arch/riscv/kvm/aia_imsic.c:173:2-3: Unneeded semicolon
./arch/riscv/kvm/aia_imsic.c:210:2-3: Unneeded semicolon
./arch/riscv/kvm/aia_imsic.c:296:2-3: Unneeded semicolon
./arch/riscv/kvm/aia_imsic.c:354:2-3: Unneeded semicolon
./arch/riscv/kvm/aia_device.c:105:4-5: Unneeded semicolon
./arch/riscv/kvm/aia_device.c:166:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5569
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/riscv/kvm/aia_device.c |  4 ++--
 arch/riscv/kvm/aia_imsic.c  | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 84dae351b6d7..0eb689351b7d 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -102,7 +102,7 @@ static int aia_config(struct kvm *kvm, unsigned long type,
 				break;
 			default:
 				return -EINVAL;
-			};
+			}
 			aia->mode = *nr;
 		} else
 			*nr = aia->mode;
@@ -163,7 +163,7 @@ static int aia_config(struct kvm *kvm, unsigned long type,
 		break;
 	default:
 		return -ENXIO;
-	};
+	}
 
 	return 0;
 }
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 8f108cfa80e5..fd4965c6f591 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -91,7 +91,7 @@ static unsigned long imsic_eix_read(int ireg)
 	switch (ireg) {
 	imsic_read_switchcase_64(IMSIC_EIP0)
 	imsic_read_switchcase_64(IMSIC_EIE0)
-	};
+	}
 
 	return 0;
 }
@@ -131,7 +131,7 @@ static unsigned long imsic_eix_swap(int ireg, unsigned long val)
 	switch (ireg) {
 	imsic_swap_switchcase_64(IMSIC_EIP0, val)
 	imsic_swap_switchcase_64(IMSIC_EIE0, val)
-	};
+	}
 
 	return 0;
 }
@@ -170,7 +170,7 @@ static void imsic_eix_write(int ireg, unsigned long val)
 	switch (ireg) {
 	imsic_write_switchcase_64(IMSIC_EIP0, val)
 	imsic_write_switchcase_64(IMSIC_EIE0, val)
-	};
+	}
 }
 
 #define imsic_vs_csr_set(__c, __v)		\
@@ -207,7 +207,7 @@ static void imsic_eix_set(int ireg, unsigned long val)
 	switch (ireg) {
 	imsic_set_switchcase_64(IMSIC_EIP0, val)
 	imsic_set_switchcase_64(IMSIC_EIE0, val)
-	};
+	}
 }
 
 static unsigned long imsic_mrif_atomic_rmw(struct imsic_mrif *mrif,
@@ -293,7 +293,7 @@ static int imsic_mrif_isel_check(u32 nr_eix, unsigned long isel)
 		break;
 	default:
 		return -ENOENT;
-	};
+	}
 #ifndef CONFIG_32BIT
 	if (num & 0x1)
 		return -EINVAL;
@@ -351,7 +351,7 @@ static int imsic_mrif_rmw(struct imsic_mrif *mrif, u32 nr_eix,
 		break;
 	default:
 		return -ENOENT;
-	};
+	}
 
 	if (val)
 		*val = old_val;
-- 
2.20.1.7.g153144c


