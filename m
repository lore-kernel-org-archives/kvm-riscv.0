Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650DDD77898
	for <kvm-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 02:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bnthD9bN6hBWWlNXfkxp6QikDbNzzpmBkOjzTgGWQsM=; b=I8LaylrueJCcHs
	ZTUta22oTYTXslm/jZ8riLXXSq1IZ8cHpIcI2vyU4LBSkdEkcYq/Q5TUmhLvKmxcCn5n1Mao6jFXo
	sCLqSQLN93y7/vIQt5eszlVPNZiYq8XsoJaCyAxbD5X7vmD+MHAtDirwUhFVDOV92iEw0H4ohVfq5
	4M8iu2tQ6BggMkjOnkm5AYgu8UcVYLIKH97CWTrxsS9HXQ+/3eEH/Fz74cebNnqH6W9TXx/nelK1I
	yrVMJ56MZ2I/IW46/nyfN21bJp5f5VSJtwa7/YZxiZQ+vUWDlw1vm6YjCTPrOl0B4AROtTESgjnsn
	HgMjWLnFD3og+DePpXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjTGj-00000009n46-0SBJ;
	Sat, 24 Jan 2026 02:20:57 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjTGh-00000009n35-0QgR
	for kvm-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 02:20:56 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c3e921afad1so1066166a12.1
        for <kvm-riscv@lists.infradead.org>; Fri, 23 Jan 2026 18:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769221254; x=1769826054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8kRNbAvCBcU6i7e683KXYAQzk2DTUU7+Egyrm6jhp8=;
        b=fI5X4YS2IqMvaE3WAcoqJMHNFjj1WCUlHMPENDrgnzoSZFl0CbCYNigvErgYmbs0Fd
         dizcMq438k4A6E/+u7K7GD3OfAzX8gpOmpE8Maxa/f3NOy9iXyf/ekvfVA1y0ECtZBdI
         oJ8ApyPmcn6pwtAAdlf6LbGjo/nRiRYRVAZe+goEJ4IFDXEYyEeQilnJTh+OnisDKY0w
         sHqpre/IMqFx66gOIy1blhSzh92M3/xVYCQ2TiwAgwh5oxg9b7vhASz2YSbPGmo++ELE
         8VgdER7ab+4a1KY7RrsupsJ18tSTq3kZaIvCgYVErNli63lJs9rrZE+QGKUqcKlELzK1
         cNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769221254; x=1769826054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8kRNbAvCBcU6i7e683KXYAQzk2DTUU7+Egyrm6jhp8=;
        b=mWhnTyVMrBtqHGEwI5UY5H+WpIEnpl6J6Bz5odVFUTHTAn931KduLmXxdyAVfdzRfe
         R35pAMj8d0QDWaD/kPhqEgGq2TdZcKIkT1OYxLSDvNHfuJOqhwWWm04LwBuI8xGPLTo6
         pBEOYn4E1Z9uaQwlFT/5J4u0fACwclarCSWW2Te6RSLzAj0OOtpsOfGMk7KajPJo8Z0w
         lmVJZ7Kf9k0CoEApT9G/1ynf/v4jwBQgtAo8ZniTf96QRL7zoVDDUPu2OjsWLssDfZhh
         RAUD25qpbSRYcMFykdmhoxxTLsKiKTLXH83r4mXSNcBbl4svzr1a3Dk4qrJKgpG7jQV3
         mWaw==
X-Forwarded-Encrypted: i=1; AJvYcCUMZnfMT4LJnpY1lIPCrRswrAqUyLkINVFY8uWDAFxMo5zWUgOKvnwMk9X2rOwl5ANICz7yy8OKiQ0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCDXzEDkP/wEV56lhqYPjGZTaPTO8rNt3CZM92MPluA+oHgZ/x
	97/MW31iJ+WAnVvIwNUVVMpxodiHRBczGlhjt7yE7EpMUTcV6GPz12Wk
X-Gm-Gg: AZuq6aLpaPGQx1XExh0PjjPNUOuXexQiUawAtEX4P8PW0el5rKQYTg4zpmM0HM07Zj/
	9No1SIg0tTrRMYDQuSnVCyRFmmss/R96sfX7hZ644M2JwHd1CIXna8iYBHYJjbrQtVAvYpDrRX0
	4/SyNkU7BrFEQq1wDZLh7GEIX97Yt8P5M2+S+E4o9CKcjAgDOp5ukUDkyDF4tF3jjXmfFjqNtCA
	n+AwiPSFxbEFN7vr8sb7itJcd5tOuhDObznTMeKMAfVbwQQ3jkYzbxkXebK2plJE/zC/C0LaEVO
	NLBCUAl8nLqJtqJw2zo1RRUi3iOZcRwsPAUoLJHn5MiX4YxykaR9w2ZhKyUOrbtG4iC00BFtBtj
	UniXqr1atJECuHrkuPagCrqnoCCmPCEeR/IADJja7enVqXzXQhtHZ0WDy8PUi/aj8WxrIO/OBE/
	8HSMlxC8+Iea5NF7Fe917S227l9Y5+mOJ47yibLRq6
X-Received: by 2002:a17:903:98d:b0:2a0:d05c:7dde with SMTP id d9443c01a7336-2a7fe73fac6mr41209565ad.44.1769221253788;
        Fri, 23 Jan 2026 18:20:53 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd781sm30926135ad.24.2026.01.23.18.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 18:20:53 -0800 (PST)
From: Jiakai Xu <jiakaipeanut@gmail.com>
X-Google-Original-From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Validate SBI STA shmem alignment in kvm_sbi_ext_sta_set_reg
Date: Sat, 24 Jan 2026 02:20:42 +0000
Message-Id: <20260124022042.2168136-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_182055_140371_1696CB06 
X-CRM114-Status: GOOD (  16.68  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V SBI Steal-Time Accounting (STA) extension requires the shared
memory physical address to be 64-byte aligned, and the shared memory size
to be at least 64 bytes.

KVM exposes the SBI STA shared memory configuration to userspace via
KVM_SET_ONE_REG. However, the current implementation of
kvm_sbi_ext_sta_set_reg() does not validate the alignment of the configured
shared memory address. As a result, userspace can install a misaligned
shared memory address that violates the SBI specification.

Such an invalid configuration may later reach runtime code paths that
assume a valid and properly aligned shared memory region. In particular,
KVM_RUN can trigger the following WARN_ON in
kvm_riscv_vcpu_record_steal_time():

  WARNING: arch/riscv/kvm/vcpu_sbi_sta.c:49 at
  kvm_riscv_vcpu_record_steal_time

WARN_ON paths are not expected to be reachable during normal runtime
execution, and may result in a kernel panic when panic_on_warn is enabled.

Fix this by validating the shared memory alignment at the
KVM_SET_ONE_REG boundary and rejecting misaligned configurations with
-EINVAL. The validation is performed on a temporary computed address and
only committed to vcpu->arch.sta.shmem once it is known to be valid, 
similar to the existing logic in kvm_sbi_sta_steal_time_set_shmem() and
kvm_sbi_ext_sta_handler().

With this change, invalid userspace state is rejected early and cannot
reach runtime code paths that rely on the SBI specification invariants.

A reproducer triggering the WARN_ON and the complete kernel log are
available at: https://github.com/j1akai/temp/tree/main/20260124

Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi_sta.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index afa0545c3bcfc..7dfe671c42eaa 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -186,23 +186,25 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
 		return -EINVAL;
 	value = *(const unsigned long *)reg_val;
 
+	gpa_t new_shmem = vcpu->arch.sta.shmem;
+
 	switch (reg_num) {
 	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
 		if (IS_ENABLED(CONFIG_32BIT)) {
 			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
 
-			vcpu->arch.sta.shmem = value;
-			vcpu->arch.sta.shmem |= hi << 32;
+			new_shmem = value;
+			new_shmem |= hi << 32;
 		} else {
-			vcpu->arch.sta.shmem = value;
+			new_shmem = value;
 		}
 		break;
 	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
 		if (IS_ENABLED(CONFIG_32BIT)) {
 			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
 
-			vcpu->arch.sta.shmem = ((gpa_t)value << 32);
-			vcpu->arch.sta.shmem |= lo;
+			new_shmem = ((gpa_t)value << 32);
+			new_shmem |= lo;
 		} else if (value != 0) {
 			return -EINVAL;
 		}
@@ -210,7 +212,10 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
 	default:
 		return -ENOENT;
 	}
+	if (new_shmem && !IS_ALIGNED(new_shmem, 64))
+		return -EINVAL;
 
+	vcpu->arch.sta.shmem = new_shmem;
 	return 0;
 }
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
