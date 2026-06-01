Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF35CD6E56
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPK5wQNWQnTEE71ZKvpU9NCv+wo3boX9oGzvVxv5q7s=; b=w5tma0iE5DcaPb
	spuaUE4pA4aWFMAPe44q6mS7Sx0Oy+aUA3KTzNWWcS7MFqOXcIx4WyWGCzlT2gKx8tZkWA6LtNHRI
	3q84DvLjLfBxQV4RCSOK3Q5ILgBIZUemApoK9e5aGo2JmFo9s5G2ezB7421ghaODVMrDyvNCHXboR
	Q4w3oSg8b4c1FCtBZqFGAbawXHhKwdW51qZUMCAvAXzjh9s3CtfK+ogifL9vD6zN/GtidZCIBKvJ1
	M2vl3skBtZ1IGgIvN6B0RtmFk0hm/geaKZzHOFLFChOxRPASbMHxiwd/WPqZzLWOPBy5/0mJOVkNa
	2REoxCxnuzrMmcD3YUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzr2-0000000Ac85-1trn;
	Mon, 01 Jun 2026 10:26:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzr1-0000000Ac63-0mAX
	for kvm-riscv@bombadil.infradead.org;
	Mon, 01 Jun 2026 10:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UkH+rbPYFBQOwWqBxudVceNf6H3KI5FVfOpH4WOZPq4=; b=oJXS+1w3DDIxlf094ZfadwuzZZ
	60Od3bdOVoqqLE1Q/eRk6QZ5s4BL3FXHYf/z6qNRQ9p5zBisNDDuUYB7m4NF9UPKy4BcZlmm7ZMTb
	SBw2z/dWUXSAjvx9aY15LT83TTVNU543Sxv1GFenUdnABAJDrEkkfjhg1UseofmO2IQwTpPf15TwG
	4GfIesNAslTNS0nQdaWpuixseR7hl7gCRLSDm5hPrRXnwZE6SSpVlQrtFzi0XY+Btt9GmWl19H3ii
	8Grh67cFnG3QrUeA/Ynwex1oU2IQed9AjByEK9M/ztOgOBljFomK7DikpPbdyijArJrBPoyVJZLyF
	69Jw5E/A==;
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzqx-00000006Nn9-3LZ1
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 10:26:41 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-136b46c3540so9939859c88.1
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 03:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780309598; x=1780914398; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkH+rbPYFBQOwWqBxudVceNf6H3KI5FVfOpH4WOZPq4=;
        b=NS6p2PgZ3a+KmMESPsdd65K2jSsQX0ywhFbGLp0Tlpph0CXZYOfiywTKvaQD6Nyo+S
         f83uX/KQMEDIK/UPeN9IcWs+01O3BHPhCOAOHEqCjXi18tc8YiPhTbGN351+ITn9+jcJ
         7Rjqkt6EmzWHUPvT1pGtGxqNfJWzISm0m73EPcg6edtCFv8xIyKPi+7Sd0zQ7XGz+6FG
         +Eb/KOxCBckYQolIP7dOIBtbm2sGwXMa0oxyIQhLPHdseMCQF+iu6CPCzbKrgpjca8VO
         ziRYjwRqvnzXKnWEZN2XuH4p9S/UU2BLoT3W1EwCQEKDYLURssX/VnhddTP9xe36haTl
         vOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309598; x=1780914398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UkH+rbPYFBQOwWqBxudVceNf6H3KI5FVfOpH4WOZPq4=;
        b=KKcp/dudcdRseY2Me8jZ5vPSpaTw4czlyd5bs415izOLrb7qbHh/iT2okfrx/m0O2X
         P3omCPzAl+Of6X1n3bTOFJEjRVRBTc3p0GjMz3UIPjoxp5YablhGvJDY31sEOpTS688g
         6kSfLdzkNGdqOqBmBFKKioV3hhP9T8EcgatuXq5lg10JDQlFk1ndrEBUx0PN9OqtM0NF
         eBGCrx3G0pI5u6U4tPM5O0b5+mQCA7izz8FIiZ4w/Fp8Vt68vgkNYAOUVz8GqO3U3yoE
         W54ayNUlLrBO8hAyuYeqWXVeU9mKHSUl85yT10X1xwdXEClN5V9T0Ff1WV+g6/H6NkDt
         SLfA==
X-Forwarded-Encrypted: i=1; AFNElJ8mOWRoVGrbAJjFcpVdZSBEVq3bwee+G0Td4MPjcg6eCHzkf76cwlncOtTgQEOQ8SmeqTKYtyigyU0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgVSiHRtnepRvuuzCwcQvhA5PNo6wOugT2BpvcB/sG+wlrYrUs
	OsOVXsfO2nf3f7STJiihm4S1cOZq85TYB1LyDunrU4F/5KwKIEldZ32TuN3C1LYBPdI=
X-Gm-Gg: Acq92OEe4re2HuhZO4m18qXEohCIAbX+Rtb95NjQRIBd9Xi4hWlxuN3rg0Lt9GluoTQ
	wZ09gkd39V3OUyXJC2c4UUce9N3v66eztefpDoJWe0VhbcGHcexvBBIy8K1BuEW8JdMCUfEvi9n
	wlxNztfkohgd3LJNL+Dw5QXo/W8DEwL4nYtJKw/bt6HZsVW0MkuvFbTh84bpR6hZcRT0SvcJODH
	OD3L1iIlN/1CSqZ7zlSztOmsnMi2fO+XZFD22jgo4rTqElLGkSYC7syjDV55cAWDPYPqNMi3NlX
	v7mkPXHw7k2e9PMsSvG1YzjU1p4GJF4ixK6QMKfXqoeEfdoJhxx9p7QMZwiG9IJVMsMJD71s5Uh
	z6aRijBCYjQ/03TaqtiA2BMDhhxFA5W2HWWh52aBZqUysTKPPmwzUHpTCBLNpentLfTXYtCkJCG
	EZX5N+R8WwpEwywBX5gKAUOxaosdNLgDGPbceexeVWeczECbHmjzfpew==
X-Received: by 2002:a05:7300:6c84:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-304fa67bcafmr4315278eec.26.1780309597890;
        Mon, 01 Jun 2026 03:26:37 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5b9be7sm8176001eec.27.2026.06.01.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:26:37 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 01 Jun 2026 03:26:24 -0700
Subject: [PATCH v5 3/5] KVM: RISC-V: SBI FWFT: Fix stale feature exposure
 after runtime extension changes
MIME-Version: 1.0
Message-Id: <20260601-kvm-get_reg_list-v2-v5-3-415d08a2813b@sifive.com>
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, inochiama@gmail.com, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780309592; l=3662;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=gfnczZN+h+rWjSUF0BJooFipVgVWUQb9pSCmrwwRlAE=;
 b=+qL9SVI0RXfE0tqzldQtvBLEC2mHZjs6gsmQCiAjT050VaVqPB7Gkj9XL3XjEOBKONYsNXAwg
 xUJ+NRYAep7D+DmPqqrsPG6bSMojxfLyj5wI5WYNqJxBrI1Z/pit3jK
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_112640_276645_669BD339 
X-CRM114-Status: GOOD (  12.21  )
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

Fix a bug where FWFT features could be incorrectly exposed to guests
after userspace disables their dependent ISA extensions at runtime.

The 'supported' field in kvm_sbi_fwft_config was set once during vCPU
initialization based on the initial hardware/extension availability.
However, when userspace subsequently disables ISA extensions via the KVM
ONE_REG interface, the 'supported' field was not updated. This caused
the following issues:
1. FWFT features would remain visible and accessible to guests even
   after their prerequisite ISA extensions were disabled
2. Guests could configure FWFT features that depend on disabled
   extensions, leading to undefined behavior
3. The static 'supported' flag and the dynamic supported() callback
   could disagree about feature availability

The fix introduces a two-layer checking mechanism:
1. Add an optional init() callback to the kvm_sbi_fwft_feature structure
   for features that require hardware probing during initialization. This
   separates the one-time hardware detection logic from the runtime
   availability check.
2. Add runtime checks in all FWFT-related functions that call
   feature->supported(vcpu) if the callback exists. This ensures feature
   availability is re-evaluated based on the current ISA extension state.

This approach maintains the cached 'supported' field for initialization-
time decisions while ensuring runtime availability is always determined
by the current vCPU configuration, not initialization-time snapshots.

Fixes: 6b72fd170592 ("RISC-V: KVM: add support for FWFT SBI extension")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index aee951f2b8e6..ab39ac464ffd 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -303,6 +303,8 @@ static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, u32 feature,
 
 	if (!tconf->supported || !tconf->enabled)
 		return SBI_ERR_NOT_SUPPORTED;
+	else if (tconf->feature->supported && !tconf->feature->supported(vcpu))
+		return SBI_ERR_NOT_SUPPORTED;
 
 	*conf = tconf;
 
@@ -433,6 +435,8 @@ static unsigned long kvm_sbi_ext_fwft_get_reg_count(struct kvm_vcpu *vcpu)
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 		if (!conf || !conf->supported)
 			continue;
+		else if (conf->feature->supported && !conf->feature->supported(vcpu))
+			continue;
 
 		ret++;
 	}
@@ -455,6 +459,8 @@ static int kvm_sbi_ext_fwft_get_reg_id(struct kvm_vcpu *vcpu, int index, u64 *re
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 		if (!conf || !conf->supported)
 			continue;
+		else if (conf->feature->supported && !conf->feature->supported(vcpu))
+			continue;
 
 		if (index == idx) {
 			*reg_id = KVM_REG_RISCV |
@@ -490,6 +496,8 @@ static int kvm_sbi_ext_fwft_get_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 	if (!conf || !conf->supported)
 		return -ENOENT;
+	else if (conf->feature->supported && !conf->feature->supported(vcpu))
+		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {
 	case 0:
@@ -527,6 +535,8 @@ static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 	if (!conf || !conf->supported)
 		return -ENOENT;
+	else if (conf->feature->supported && !conf->feature->supported(vcpu))
+		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {
 	case 0:

-- 
2.43.7


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
