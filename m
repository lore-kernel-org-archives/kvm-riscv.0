Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7F9C982E6
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 17:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tFe5ZXP8XgBHGjD4Lx5F3yhUk8Pn+z7ulKM1xSKQ5s=; b=uSK8lErhvasCCZ
	xa47LPb7uV+N0Uy76jCDdY4qUKuI8Tnn5keO5Ao1+OOGSNAxtH5JMwkU/nJuCuT8WBi9JxiCYjS2/
	8o+KqyKEtu2Wtc33AnsZPllFjMFE91bRBa44VEwj2GQcMFFX+dSpth4h+QSIhV+W+aAsd2NH2L/We
	ya2VzhL9aQ7FMKOpluwY2rj7HWjijJpSnAzsrIOSWXarIy+WkVfuWJJ0/0gZr/eeWyI4Yud9ONfGY
	VbCmXiKXmHLUr32hXgC7AlBTvVQmlfWSXPdRx5DUeXdmsAOYZJaRatTY0ZFwHKGJ+E9S90Jhvf4yT
	BQyyJUmtpYq8OPCsTCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4a-000000031gj-1Deo;
	Mon, 21 Sep 2026 17:45:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4Y-000000031eR-2qTK
	for kvm-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 17:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QYiGmxrgAXU1trJ4S0lv2S3WvlXO7vDS7xlQ1HDVynU=; b=Flti1J8e1dzqo9BFYDnlt8OL8y
	WPvqbbagd8cmMTo5sOnl5i3wbIyUJf8ZaOEeZI6VUsIfIFw9Xtb6geomrJjiZNWE/VO9ddFNFuGGY
	8o0tj2rSujVu23MG5yxkx1GHtIpbstbf4Ja4T4j5B15Fh2fC2ig2+DFEDmBWoLJpiCcYHHUVCeqWe
	x7sgztD3blzRYfuI6NCF1M2S6HFz7pwAzmJQw2jwN413xJwgx3jcXZB8XEr6kyxNJs7I1Jzp18K8/
	19OqiF1DTzwpglUOnLESvQuDVa/XQHQLbnXqp5HH+AV5HoyoGP4eZA1tNZ5Dx1ai4UuuwCqaxEEpJ
	Rka4OdRQ==;
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8i4V-0000000Cdqq-2p9B
	for kvm-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 17:44:57 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so543095a12.1
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 10:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012693; x=1790617493; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QYiGmxrgAXU1trJ4S0lv2S3WvlXO7vDS7xlQ1HDVynU=;
        b=G7buLvgre07kUkrfJ8slCNIZe1DGxy4qP3Lfeb1lARrdDC/leQoSHSxjHf64BijtP/
         RFjFQxfU4xJp6zmglhGFTMc+8GM4L+qTYWJTYIlnefjH8Qi0QsQHsOFWR1xwUadaor4R
         GBVhXIy5V1HETUvgJvMDoPWhS5wKDpWtFdLN54P8WUD33L+e9naAoA61McBlNDc97rx9
         bgr4Xadf+AaH+Oy4drAhP/NrLbKxnFjleGVgIRf/kqBNbup+lXiIpzbI/LZpUweNZjXU
         LAMTztFSRoeRO5B1H+BJkUQLWO3HMsOCuhNyuuJ9FJaqFzCDdCvZ7bVqZUP0blTrqh8H
         FIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012693; x=1790617493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QYiGmxrgAXU1trJ4S0lv2S3WvlXO7vDS7xlQ1HDVynU=;
        b=EkvgBMi3Dfn4Y8bOfKR1jkCoTTn3MdQIhKKkorpmqwUFgOmkMexmSxvPe7xBshOK4u
         d8l/LEH2JSDyt2pgi1kBPT6nJXL11Bz5F7I3jz2+NkOnAKFm7ZBnQ+8R3JKWCawQVRrW
         E7HS8CLmZT3w/5+7Rrd2ZklS80pgKToos0/Gh1LxylAB738dKWM+3lURk3NjGs4Qmx0C
         dorhXguBXlFkNRA1/AG4et5zCRRImk2kYp7vQIB+aKw3OpNKgeRQwA/hGRQ2PMhMDLK9
         sFgEQMrX3sTsJIXp2xWb1LvZTm7My+6T9u1JDXu+zczhcrKgqO4neKmOkDex3JZgGaei
         Lvpw==
X-Forwarded-Encrypted: i=1; AKwUvByICZ3fg6szDOJZ+nv+4qDHGQfk5cvWP+4FpoaayNPoNbs0YROgnFGdrv01RggoO3poPW6GIy4o21A=@lists.infradead.org
X-Gm-Message-State: AFuF++kWpLLFzJ5OAtTW4HzqucCmEQEYPTcREY7pl6idPam/VSxwPh+K
	3PtIIReior7TZsRDHTFVo30xAMr+knAYqWOgpWLaLfTt0IwGsncMFqzcqYuo+wiBmOKwLUvAlHM
	Y7PdQoQ==
X-Received: from pfbhu19.prod.google.com ([2002:a05:6a00:6993:b0:879:55dd:922d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ad89:b0:85f:3d78:79cc
 with SMTP id d2e1a72fcca58-874dc4ed21dmr15528120b3a.9.1790012693049; Mon, 21
 Sep 2026 10:44:53 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:44:43 -0700
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260921174445.911676-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-6-seanjc@google.com>
Subject: [PATCH v2 5/7] KVM: Move check for existing vCPU ID to the top of
 vCPU creation
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jean-Christophe Guillain <jean-christophe@guillain.net>, 
	"=?UTF-8?q?Pawe=C5=82=20S?=" <spawel523@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_184455_866283_B5F2E383 
X-CRM114-Status: GOOD (  11.83  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Now that kvm->lock is held for the entirety of vCPU creation, check for a
conflicting vCPU ID at the begnning of vCPU creation, before the arch
precreate() hook is invoked.  This will allow reverting commit 97d65b544f48
("KVM: Check for duplicate vcpu_id as early as possible").  For now, keep
the redundant vcpu_ids tracking as a sanity check.

No functional change intended (absent KVM bugs, checking vcpu_ids and
walking kvm_get_vcpu_by_id() should yield the same result).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c17cc8dd371b..d5524ac8c5cf 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4182,7 +4182,10 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	if (kvm->created_vcpus >= kvm->max_vcpus)
 		return -EINVAL;
 
-	if (test_bit(id, kvm->vcpu_ids))
+	if (kvm_get_vcpu_by_id(kvm, id))
+		return -EEXIST;
+
+	if (WARN_ON_ONCE(test_bit(id, kvm->vcpu_ids)))
 		return -EEXIST;
 
 	r = kvm_arch_vcpu_precreate(kvm, id);
@@ -4221,11 +4224,6 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 			goto arch_vcpu_destroy;
 	}
 
-	if (WARN_ON_ONCE(kvm_get_vcpu_by_id(kvm, id))) {
-		r = -EEXIST;
-		goto unlock_vcpu_destroy;
-	}
-
 	/*
 	 * Set the vCPU's index *before* the vCPU is reachable by other tasks.
 	 * Unwind the index back to -1 on failure so that KVM can use the index
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
