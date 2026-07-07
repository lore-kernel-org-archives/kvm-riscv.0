Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B433C43458
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4sJZB8pZQ5Apw226wZxMd+VuJcsk9ja7XTMh8CZ6BNs=; b=Yoj0hQQjrZ3dYm
	5oUVm1IoJebvrV4ka3oUZKg54pzMlIc48ubviDzBgEwpLQ+D81gInhY+SKoSmojhfhcAic3fQ5M1J
	NRqgIjrS01kMvu0qONC+nbmTFLswxN0T/5PXXszIlPL4qwg45q3jqGd7B+QCm6tJNtuUPnjatt9+4
	gTtQDNSws9zS4zye00Oa+xbZktDNKWvWLOshMfkooPNlr1kcX4T4/QY4FWJEr2OILJWbxD2k0wdKK
	P4dfacHAchljzN1kI+kiJ9jLR8c1zOzf264ZDxmzFbHTd+IMKBinxa7QjS351LeA32pSzAZwSEhVE
	K02AFuERt+awiNviFJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4sK-0000000Ex67-01Xp;
	Tue, 07 Jul 2026 12:26:08 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4sH-0000000Ex4r-3qTW
	for kvm-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 12:26:07 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3817f800c8bso3019226a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783427162; x=1784031962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed6PrIAg0FPe+WGfGcpcFPgwTg/czpiwdi1SgU6ZCUw=;
        b=MRc86E5DkQNyiUzNiB0Z+L9LaiBswyAqERGjspvAZtIVareal0Ubv5WECCHLrwX6qq
         nbxKf6U+xsPO5SUb6IpSLsb3Ao3Na373gNryIfSF/2xEtZcJIoTANsg03rDOVEvqV5Ot
         NBr9mx8l7cx8Vm7fh2ArUelldZuEfWoaj5D6L542DpzNFuRKzm+C2S+x8GQimIlCwkL7
         4VVkh/dpTgtZSW7udzMaxnDbTgDCLAuENUYEMAwbGjNWMxSM0GebRMFG2JulPpuHLbCC
         HiU9exIfxZHTLHaN+TcaGVZcL1LoDtnwCb6wsG2K35m314Fn7DQURfeVgdcInXS9E+re
         Xn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427162; x=1784031962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed6PrIAg0FPe+WGfGcpcFPgwTg/czpiwdi1SgU6ZCUw=;
        b=tOp1KqmaQeFGFmrgKZukDum14lR+F0m+BRDLvrzE9AK+VCMje7yJlbSW9Fsav+FzxY
         sCGxdXsabJBKwxeHe3Qp9EX0Z5lbRDBCZhZRdLnOqRf2SZiqj1AKInKBxjpvmKtsCod1
         WqAATTkgTEjtHfbOQ0EUHIGiApeUfcUkZ6pycDUav/xLwIenlP10tRkUD8QMB6PqSVyS
         BHpeiweEz/bhIeZkW5Qb8b3fUy7dqfrbYmgWgRVgs71ltOT2QSsThNWThc7CFUmZp1os
         vCfW/XLUoZRvdJ57MEl2EDfgPDcStCEse0atgnKEWWVs/d8w1wa6dku27pauepfKTwEq
         ySpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVq+ArjIxi5JsV3gw+h6LNhZWGSUMcVchiUaW9So9ok7froSGS3EG7FwsVGYmJ4UiStuWRYTuJk2o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6z8z/A12yj6Q6S2un7fTww/knrNvAfxI0bzkMi/ZeiJUZiP1E
	LhDsSut+ECHwmOmFDcRw5rrE8gQ43x2cTHPLrKTIF+dRgsxvcsjqHIdMrxBaC0q/aqM=
X-Gm-Gg: AfdE7ckyYtGmtpT6qw9V4crqBpTRKUeotuos4r3QKHJ1FhluX0Tp4s8JWR2E9p1jKMf
	ur0Vx79wz0cXsOqvACes0vbgyk3WZZ1s+OM687ADTjKMXOJdbPBEBVb3BSSQtYuS4vM27Bl80An
	2yQDBhUKs+ZxQu2wWFndRCt2Iplj/q5EFPBoRKNLESzbnaUcGowg7Eytr+tL533d3SVaMdGjwQK
	F4lOFWdSthNzyeIkgLy5fmu41goYsYTd5hfYhM1f4P17dh4+w06DeScxoJgmLZs6c+TKNC7bZe2
	4l4qcNL7Z4VrxInFtg90ELPiJDSqRW4LJGEYmcxuKNw77jU5D3EACurGbhgu+92/fkRf89gdRG9
	sxDa/YVUro3XthOFG620744Qr+sFJvunDFI3FssBDP49z/jOB2HmiR7iHpZntM7PV+Qhhi35A5q
	zBCX4WjYFaSKaza+xhVcZCJ9P0VHHr5UKAGzOQp6Bwkg==
X-Received: by 2002:a17:90b:5845:b0:387:e0cb:7f7 with SMTP id 98e67ed59e1d1-387e0cb091bmr2435479a91.43.1783427162360;
        Tue, 07 Jul 2026 05:26:02 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d2585f34sm1028119a91.17.2026.07.07.05.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:26:02 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH] RISC-V: KVM: Inject instruction access fault on unmapped guest fetch
Date: Tue,  7 Jul 2026 20:25:48 +0800
Message-Id: <20260707122548.281685-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_052605_948534_31DB8D28 
X-CRM114-Status: GOOD (  11.53  )
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

When an instruction guest-page-fault targets a GPA that is not backed by
any memslot, KVM has no MMIO emulation path for the fetch. Load and
store guest-page faults can be routed through MMIO emulation, but an
instruction fetch has no data payload or access size for userspace to
complete in the same way.

Treat this case as an architectural access fault in the guest. On bare
metal, fetching from an inaccessible physical address raises an
instruction access fault for the supervisor to handle through its trap
vector. Reflect EXC_INST_ACCESS back to the guest so the guest observes
the same class of exception rather than leaving the fetch as a
host-handled condition.

stval contains the virtual address of the portion of the instruction that
caused the fault, while sepc points to the beginning of the instruction.

Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/kvm/vcpu_exit.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..6c8530b9f29e 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -38,6 +38,25 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			return kvm_riscv_vcpu_mmio_store(vcpu, run,
 							 fault_addr,
 							 trap->htinst);
+		case EXC_INST_GUEST_PAGE_FAULT: {
+			/*
+			 * No memslot backs this GPA and an instruction fetch
+			 * cannot be emulated as MMIO. On bare metal a fetch
+			 * from an unbacked physical address raises an
+			 * instruction access fault, so reflect that back to
+			 * the guest.
+			 */
+			struct kvm_cpu_trap inst_trap = {
+				.sepc	= trap->sepc,
+				.scause	= EXC_INST_ACCESS,
+				.stval	= trap->stval,
+				.htval	= 0,
+				.htinst	= 0,
+			};
+
+			kvm_riscv_vcpu_trap_redirect(vcpu, &inst_trap);
+			return 1;
+		}
 		default:
 			return -EOPNOTSUPP;
 		};
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
