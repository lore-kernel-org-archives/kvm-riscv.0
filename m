From: cgel.zte@gmail.com <cgel.zte@gmail.com>
Date: Thu, 21 Oct 2021 10:45:36 +0000
Subject: [PATCH] RISC-V:KVM: remove unneeded semicolon Elimate the following
 coccinelle check warning: ./arch/riscv/kvm/vcpu_sbi.c:169:2-3: Unneeded
 semicolon ./arch/riscv/kvm/vcpu_exit.c:397:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_exit.c:687:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_exit.c:645:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu.c:247:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu.c:284:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_timer.c:123:2-3: Unneeded semicolon
 ./arch/riscv/kvm/vcpu_timer.c:170:2-3: Unneeded semicolon
Message-ID: <20211021104536.1060107-1-ran.jianping@zte.com.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: ran jianping <ran.jianping@zte.com.cn>

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ran jianping <ran.jianping@zte.com.cn>
---
 arch/riscv/kvm/vcpu.c       | 4 ++--
 arch/riscv/kvm/vcpu_exit.c  | 6 +++---
 arch/riscv/kvm/vcpu_sbi.c   | 2 +-
 arch/riscv/kvm/vcpu_timer.c | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c44cabce7dd8..912928586df9 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -244,7 +244,7 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -281,7 +281,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	return 0;
 }
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 13bbc3f73713..7f2d742ae4c6 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -394,7 +394,7 @@ static int emulate_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		break;
 	default:
 		return -EOPNOTSUPP;
-	};
+	}
 
 	/* Update MMIO details in kvm_run struct */
 	run->mmio.is_write = true;
@@ -642,7 +642,7 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		break;
 	default:
 		return -EOPNOTSUPP;
-	};
+	}
 
 done:
 	/* Move to next instruction */
@@ -684,7 +684,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		break;
 	default:
 		break;
-	};
+	}
 
 	/* Print details in-case of error */
 	if (ret < 0) {
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index ebdcdbade9c6..eb3c045edf11 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -166,7 +166,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		/* Return error for unsupported SBI calls */
 		cp->a0 = SBI_ERR_NOT_SUPPORTED;
 		break;
-	};
+	}
 
 	if (next_sepc)
 		cp->sepc += 4;
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ddd0ce727b83..5c4c37ff2d48 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -120,7 +120,7 @@ int kvm_riscv_vcpu_get_reg_timer(struct kvm_vcpu *vcpu,
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 
 	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -167,7 +167,7 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
 	default:
 		ret = -EINVAL;
 		break;
-	};
+	}
 
 	return ret;
 }
-- 
2.25.1


