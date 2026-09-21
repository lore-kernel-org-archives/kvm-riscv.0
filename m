Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6CCC982F8
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 17:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFpS1wAUOZExor+0+qvINGjcPgACZWYXTSCcHWumrl0=; b=KzyzPT+FOOXEIL
	9w+OKLcwMa7zHzT+QCagSk0lWfTjydIdWJNz/yHNdhiONm/uDy6IGS0Ci7VdIlLiBaBHojFk6rzXK
	qbvuteTT2TrY1I2a4MU4eWqawldUJUOB1soZyVafcFdCDjqKv92zv/KWhCc1A1o4QAscFE8xncSrj
	E4jA8oHwj00MRKTp7u+xVm8CvsQq9mNZ65GS0mrxgXKfZQpJ6AGK9bodLSwx018lc6V42ytidUbnw
	QKnmetPFaWWMCNZ+6n/Rz3X6wVqK76VyjJa39lT9wp0Bk/WOb+5K1Uo5ixgAXRKNOQNCXg+ALYPLV
	qgZ/1zTrPracrUdjCB1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4Z-000000031gC-3P9Y;
	Mon, 21 Sep 2026 17:44:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8i4W-000000031ck-0wfX
	for kvm-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 17:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y4bAp3nBUO90ZQn1u2Z0gOxXpoxTWghtyWO5GBrBpXE=; b=c/YV7KlY/jlEHtoaHI/ICJGllQ
	q3l0BLpg8sfrjBw2hgjQOfzxFds8YjfLgQdQsz2v2hjY+qmzSnrkyi7X7hFivI3rr7mdMoWts09/Q
	k2WGwjXb9q3g+KwcxF4HfLXSljDLJeDi0ZX6cDwGs65YNI8UR0bLomDDJSHEBotB3iVPusG6TqVUc
	9eMb6c3E2fe4fLmoa3tOlOg15Q1o3D8WwDR37SvJh+mSVrSNRIl0t3H3LsT4e7Pi9qMfKH5tz4llQ
	7pfd4buo1RvU6UYvujHM9gZtSUWiuOiM4hsnNUgSi+Q924C8TPuU254fJ2A6Ukv73hoR2pdjePJfD
	MHROlQIg==;
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8i4T-0000000Cdp3-1erb
	for kvm-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 17:44:55 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso2826940a12.1
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012691; x=1790617491; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y4bAp3nBUO90ZQn1u2Z0gOxXpoxTWghtyWO5GBrBpXE=;
        b=kfJz29Kje/A3oInSeCZ4/WNJGOz/KwJtH8NpsA4Q0ElZTgkudCSaAickBpae7xMLpO
         4D9o6cKEJDxm+qYHPmpDb9DVYr4qWBXdHH1Fwq18m4bMGrPvV81+5kgfnHaD9tfuWm/i
         il24IJKuFQxGfDEhyn0RpBU2ds7erIDovcPtnzCkFPUnIKyf1DXCymeMF7dnCPVUg9C6
         qKMBv3CHGwa5jotEz3XzTVmsz4O+mnrFFEuxAs+7/qcrySAAA2cfS/DH/AP3S2hHaB6u
         wGMJGqnuMM6716QxVy9YJZDUBuAaCm6XZ0rR0nwIhBibZF/YQlohcVYGUC3f2uXWu35z
         H05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012691; x=1790617491;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y4bAp3nBUO90ZQn1u2Z0gOxXpoxTWghtyWO5GBrBpXE=;
        b=FCY8nSmO+0kRwZXG4ybh3lQpliLj1DMAo9v2L2PcNr6pyn/C/OUlEz98w3C4AjaKD8
         y0WGrB0HvilL2uvMF3ujyFdSGIGH+HWgNal2sfMo1uaTy8B5oxX8O/NooqvDhIMYuZte
         uwTljOCZsHZJDNgbLYMELY7KJGzNQPYTfi3xo6mWNP79kAo8gSyAVGv/n97m8hKfR/WP
         hGiyQ1DPmwtKiAVQgZZXhmLsM38fYkgqb75/5fCZL3w153IoAvv4nskwYW/W57i/sxIM
         vdmfRvS2zDnHIDQbMWbOQOM6Z9opxvZaH70+XAYo8oxV1CsmIuG0LrOXnCCyqeNw9inE
         napg==
X-Forwarded-Encrypted: i=1; AKwUvBzL9PPshQoMTGK3ig8Tr811Uot5owOHR11z4i6LvwgS0sIDGOhzKrzwyz4b+NrNLLYTe7q7CsEXAsM=@lists.infradead.org
X-Gm-Message-State: AFuF++nU4MsUsGznBdeLDLXuPTc88bYFbujL8d20N2EzMNwplFQSKrjW
	NkNZa/r8igWspE9JMN1goqx9iPBtXs92FTeidYQgVwRyYJsyqliSG8+nSQHB1krCq7SJN2hlSog
	Xd7Y6qA==
X-Received: from pgvn10.prod.google.com ([2002:a65:63ca:0:b0:cc4:5907:21e9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1b81:b0:3cd:8bba:824f
 with SMTP id adf61e73a8af0-3dd8c3d3acfmr19085095637.4.1790012690700; Mon, 21
 Sep 2026 10:44:50 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:44:41 -0700
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260921174445.911676-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-4-seanjc@google.com>
Subject: [PATCH v2 3/7] KVM: RISC-V: Use kvm_is_vcpu_creation_in_progress()
 instead of open-coded equivalent
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
X-CRM114-CacheID: sfid-20260921_184453_665698_AE5C5690 
X-CRM114-Status: GOOD (  11.34  )
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

Use kvm_is_vcpu_creation_in_progress() instead of an open-coded equivalent
during AIA initialization.  Unlike similar vGIC code in arm64, the relevant
RISC-V code runs under kvm->lock, i.e. can use the standard API without
hitting lockdep false positive.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/aia_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index efc7c0bcfba9..97833a04268a 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -237,7 +237,7 @@ static int aia_init(struct kvm *kvm)
 		return -EBUSY;
 
 	/* We might be in the middle of creating a VCPU? */
-	if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus))
+	if (kvm_is_vcpu_creation_in_progress(kvm))
 		return -EBUSY;
 
 	/* Number of sources should be less than or equals number of IDs */
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
