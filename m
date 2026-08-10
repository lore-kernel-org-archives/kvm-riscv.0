Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26FFC5AD55
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 01:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:References:In-Reply-To:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AySqJd8Rtpd84UmGB3/u7CTc86CEDinEhvzHA04XgEY=; b=vYtnsSoiPyPWtN
	20euug0tZm4KCxqArPlg4/4s+K16r5ntJR/u3ZDPvcvkE0y/i6dHxPgwvcUDnJMise2f0Q2U4kNhR
	oc0BGYftOOpMQTg+ciC3eZPtTCoLDPRDRaPlwv0kGYnOX2IjqiE/RMGI+0YDwNOT6/yaT+ZxLj0hO
	QID4HczHbZACXHFqBrpevJSGUCF2F81niybeBCGVKFOkdxc3Q64thfliB6wv8D/Y8bb2HV8kYyAGS
	7vP6t9fbRZdROSZPSxFCzf2Y6HIyBSLdnBwC2BWN5yPMgbFEXFvUOYT2JQAoH7uUQustPuazCXifj
	mN4TPJGiX5wdc3v4+gaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtEhn-0000000AsYu-05D3;
	Mon, 10 Aug 2026 01:21:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtEhl-0000000AsYl-3r9O;
	Mon, 10 Aug 2026 01:21:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04009600AB;
	Mon, 10 Aug 2026 01:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2F6EC2BCB9;
	Mon, 10 Aug 2026 01:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786324888;
	bh=wtmq7XEHRea751PL39TRlvgDocVMtRKCug5O3oxwNMY=;
	h=From:Date:Subject:In-Reply-To:References:To:Cc:Reply-To:From;
	b=jOIyANRjChkfhnf1TDDEp/25gy56crXsNumbU5wcaE2xTv66tOov7+p7/1xps12xs
	 /hpsHXPrGs0dFHe8ACIH398ZnUbHR5OtEgl7kSMTBVPluPfLNPtl6UxQihbNx9tzg7
	 kpRet4p4abikc64Q7fA7zcUjcvF5HlIbi7Tk70j0wNejWfn8LBoX8OqHAvEi+ldbW0
	 PFnskIr/3JKYxDBhF1GyzwvfAO6Nmc6pusrttL/SlMIlUTxvRufmCTFH/+Ys8JC/qY
	 c1P45RyWDQRECqGU9xBF9ibxUAnUewOvQazThPPsLNk4lh0GrcD+eQD4wJ63nkExRX
	 /tQmQhq7YuUwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDFFC5AD55;
	Mon, 10 Aug 2026 01:21:28 +0000 (UTC)
From: Xie Bo via B4 Relay <devnull+xb.ultrarisc.com@kernel.org>
Date: Mon, 10 Aug 2026 09:21:15 +0800
Subject: [PATCH v2] RISC-V: KVM: Serialize IMSIC attributes with vCPU
 migration
MIME-Version: 1.0
Message-Id: <20260810-imsic-attr-race-v2-1-00ed95ad321e@ultrarisc.com>
X-B4-Tracking: v=1; b=H4sIAIoneWoC/43Oyw6CMBCF4VchXTukLZeqK9/DsKh1kEmEmmklG
 NJ3t7Bx6/JfnC9nFQGZMIhzsQrGmQL5KYc+FMINdnog0D230FK38qgk0BjIgY2Rga1DkK0x2sq
 6biSKvHox9rTs4rXL3bMfIQ6M9ucYraSpWqVLVRndnEDBcru8n5EtU3Cl8+NGDRSi58/+bVYb+
 P+8Syl9AfhrvaPdAAAA
In-Reply-To: <20260721073612.137259-1-xb@ultrarisc.com>
References: <20260721073612.137259-1-xb@ultrarisc.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Xie Bo <xb@ultrarisc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786324887; l=2118;
 i=xb@ultrarisc.com; s=20260810; h=from:subject:message-id;
 bh=FN+s+dZU8x/9zYsAqO7dZdJ8/YEPF8j1I2LUPLYxSPg=;
 b=At33xJ3dHR0j9wXFxdIzEYGU5MBM29ywdU+QrQSNgCvRQNCU4eMc6niylLaA2OdmR+6z77Yzu
 7ObKeiaeOz/CkmbCVfPYMdMk6cLpWur30kpe8VcTE2Kd5XihS+Wycvq
X-Developer-Key: i=xb@ultrarisc.com; a=ed25519;
 pk=Yb4TfiqO0TRwfKy3wvnt0+tbk0/QQQ42+O1jBrVaWq0=
X-Endpoint-Received: by B4 Relay for xb@ultrarisc.com/20260810 with
 auth_id=933
X-Original-From: Xie Bo <xb@ultrarisc.com>
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
Reply-To: xb@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: Xie Bo <xb@ultrarisc.com>

KVM device ioctls are not serialized against KVM_RUN. As a result,
kvm_riscv_aia_imsic_rw_attr() can snapshot the physical CPU and HGEI of
an IMSIC VS-file before a concurrent vCPU migration releases it.

The HGEI can then be allocated to another vCPU before imsic_vsfile_rw()
uses the stale tuple. A GET or SET attribute may consequently access the
new owner's interrupt file.

Serialize the entire IMSIC attribute operation with the target vCPU
mutex. This prevents the VS-file from being migrated and recycled until
the attribute access completes. Acquire the mutex killably so that the
device ioctl remains interruptible while waiting for KVM_RUN to finish.

Fixes: db8b7e97d613 ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")
Cc: stable@vger.kernel.org
Signed-off-by: Xie Bo <xb@ultrarisc.com>
---
Changes in v2:
- Use mutex_lock_killable() and return -EINTR when interrupted.

Link: https://lore.kernel.org/r/20260721073612.137259-1-xb@ultrarisc.com
---
 arch/riscv/kvm/aia_imsic.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index d38f5de08..74f520e57 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -969,9 +969,14 @@ int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, unsigned long type,
 	if (!vcpu)
 		return -ENODEV;
 
+	if (mutex_lock_killable(&vcpu->mutex))
+		return -EINTR;
+
 	imsic = vcpu->arch.aia_context.imsic_state;
-	if (!imsic)
-		return -ENODEV;
+	if (!imsic) {
+		rc = -ENODEV;
+		goto out_unlock;
+	}
 	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 
 	read_lock_irqsave(&imsic->vsfile_lock, flags);
@@ -995,6 +1000,8 @@ int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, unsigned long type,
 		rc = imsic_vsfile_rw(vsfile_hgei, vsfile_cpu, imsic->nr_eix,
 				     isel, write, val);
 
+out_unlock:
+	mutex_unlock(&vcpu->mutex);
 	return rc;
 }
 

---
base-commit: b95f03f04d475aa6719d15a636ddf32222d55657
change-id: 20260810-imsic-attr-race-06772a04450e

Best regards,
-- 
Xie Bo <xb@ultrarisc.com>



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
