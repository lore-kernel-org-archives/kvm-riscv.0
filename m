Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF13BC98314
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 08:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E0cr+Y4lxB3IlAKjwrkiDg9dX0YvcA7CAY7Odzrt8/8=; b=QmCIGMe8iRPVyN
	suczQ2WXMfpQHH+FG72vImTWbVM0Y3H79FFqlESyu5EmyyZjL8e00iJmLn6XvofQViT7DKbVwPcQ3
	5AqsDGlBVXqOXv2mCoV3VYhGjWGoHmksmTPFbq82bRWxY/zE3Fl15EfSNVh1HnQ/aVNv7e350wMvX
	fDO3dXts/oHzkZv2wYXCTomPd79k3xSS1hN7Rqqw5e+acPMOecg2CYuXeV9SkKb8oAvZDin4/LA9g
	53US/LXR2cccgZUN01PpbYm/DuYUEtcIddulHLQKxwyRJoRUng9FBlKAuIEa5UEIKBNiX+/srdvDH
	4ptyoAcopuQcixRys4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eX7-0000000AOT5-2F9n;
	Thu, 24 Sep 2026 08:10:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eX5-0000000AOSZ-10eR
	for kvm-riscv@bombadil.infradead.org;
	Thu, 24 Sep 2026 08:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=qskrl8FoTONerp5XUUFpCXSU5ueWew9f+qB/NK4x0zg=; b=fSth7Kh5c755weaDih5T8J82b1
	2tDd1pFIIW/Ab8C5qgdo3hY4TX+rSAL5ZW5cshDxfgCkSXvByAMdDu76oGt8Ji0IUKO6jE23sArZb
	KpjiCmulQdHKVE64fUyQsEQ7d35lAaQ6VHdDxJ6C5xtWK5gwI505VrVSXL1UJek4SZNj7Xyi2d6g+
	XH5bvQHD27n7g9ew7XiPf91etqHXSMJHCVL1K+RSeqZlr1hRdG2QmNNsSkJswt3vP6W2pYuKiSEej
	hIMSuy8Fv8zqoczbj94jnfEdgewWjmpnIXyRtndCEFold5QfC/MGAyBPwSOXYrUKUMM33lcxVxeUA
	qZ1obQSA==;
Received: from mail-dl2-x28.google.com ([2607:f8b0:4864:38::28])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9eX2-0000000Fhcy-0BNN
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 08:10:17 +0000
Received: by mail-dl2-x28.google.com with SMTP id a92af1059eb24-14373bcc010so1917163c88.1
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Sep 2026 01:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790237413; x=1790842213; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qskrl8FoTONerp5XUUFpCXSU5ueWew9f+qB/NK4x0zg=;
        b=Fz2XwYHVCwGa/kFCihjHt0PZMnB1Mv1RRHbVI/o7MjNycnaVTcmFUsIKoMzPZ3fJgB
         lKy1afSitVcA0e0H6bsuxsGnALcTz2wtIice8Gbxi75LmdLqd5Nl+rOOSE9wcfPsVJ6O
         roSKD3x6jUuy4XzZNLo97onmWO3QIvpGzLG292J1R0wYYUjNKGv7KiXSf9/8hpbZbTz1
         s9NyuJwsPKDgVhz6qt+D9Kx0rYqVJjw14laBkNXPF09QzOEQZ9FGPq6WBp6A7JO8pSLO
         wxhFh67rkfgwLBNXzajN2dOYXYwobhZMyLizYNuDLbai53WhK9a0XrhKy+MIhBLUrMVa
         GZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790237413; x=1790842213;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qskrl8FoTONerp5XUUFpCXSU5ueWew9f+qB/NK4x0zg=;
        b=xK4sUXxNYPFtIrBWWFkdSltAf/I3priMOB4HdXwqQs6khyd3oayhOP74rKEqJf2dr1
         DV9+L+M9tFsghzKkg4h4fGaD4H4+gugLQ2BDKXL/TCjzhG04IeSSpwc3e80eM1pA1TWR
         vG5KmlnpsZ3R46oBYNXk7JJa7bYPFb3rLYIDGJ9Pzd9qzbOc7xznOqoyQ31FtxePyzl0
         HUPPavrSB3nDoF645VJbW5HGdQJo50B2FfCvCllUcr2sJRiEidrsS4ZqCk3UWk1pWwtF
         jUhmeXL35nD55IblctkT/6Id5SyaYMaj+PFv/r2jdpNBkp/COLIu77bwJz2nksx78ZEX
         6jjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzISXyHHAeZ4uzydFYyqvj/QWpDZZuwiqVoYkus4mE5lEWi/flWdHEDjE5yvP2Xq8JUB7eqHowYhxc=@lists.infradead.org
X-Gm-Message-State: AFuF++khOmgfo7hSPwevoXa0rNKJ4FpZyzdS5mfnrYw7WK9TU11axKjG
	VrDqScszZu8NYvKYZFKW7dZYe8pF7ZXpRAOvKxEZABDhc+B30U/lXqXjUQbMTpcwzi0=
X-Gm-Gg: AYBFou21WJlVn3gqaCLpoX9riDdSR96r1CSQVABAbW6X95I1cqsl95vygJhBkKYXY7e
	u92J+EpghVhTrm2HyeKi7D9q3SoKN1EhpvQ8sc6z/qDUyt4eGUv+NF4We0NBEs8ZtYZaUL5CAIB
	VdaUvb/uzZwLSvIrsXYrcSNVoWSqOwL6WHo183f/yCIeFlTkb1EMpyxahUBxiPrbMQG1RQ8ymok
	GQVV2kSgCeifkRcHG2GFm9uI2uyrwPG9VOrEAtKCRz6vtvALyHjrtCdzEkCEQAWYNvjRlVLwhRW
	uTpPPjWVqAJR3smRk3wQK7OgYCpdZzPIAm/qVOczM8fsGcFfxxv69AH4ngtriwbYLzPz0m5rcyo
	g2Dmma+c5FSysgJlCwtS9Nn8mNeGelbtzjNb6kWGWXBAsh5681IIheTbPyPFKpixgiBgCr/c9C4
	f6QChvKIy8hh7PgWTXOVJE+PgSiN64t9PsKsb4Q5bWWsxNB+QQ8Iof/OwftknH9B7Z6N+yJ6oZR
	US2xyvbZECYDmJO5Rk=
X-Received: by 2002:a05:701b:42c5:20b0:143:298f:33b6 with SMTP id a92af1059eb24-14503fe4a39mr1479373c88.46.1790237413336;
        Thu, 24 Sep 2026 01:10:13 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9390183sm10838473c88.0.2026.09.24.01.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:10:12 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 24 Sep 2026 01:10:10 -0700
Subject: [PATCH] RISC-V: KVM: fix the Zicbo[m|z|p] block sizes in
 GET_ONE_REG
MIME-Version: 1.0
Message-Id: <20260924-kvm_fix_cbosize-v1-1-e57eec1b19cb@sifive.com>
X-B4-Tracking: v=1; b=H4sIAOLatGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMT3eyy3Pi0zIr45KT84syqVF3DpDSj5JQUIwuj5CQloK6ColSgNNj
 E6FgIv7g0KSs1uQRkjFJtLQCMNJxCcwAAAA==
X-Change-ID: 20260924-kvm_fix_cbosize-1bf2cdd282cb
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 Anup Patel <anup.patel@oss.qualcomm.com>, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790237412; l=1573;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=EbRsjy+izD4FGJar3RutZAfTClGR/6Al7JWVZmKxHY4=;
 b=ktuwHwkl+sNKmTBsvPQ0ePdlIJCd1cN4B/8rlGZcLD78YaixmZ3+Sr9zf3M4Ve+OkLZfg1JZ5
 NDnGj8FH/u6AD44JXwxKm5xyMK8rr/ydh0aXz4LawdWbz5iOAe6oTgj
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_091016_503363_39EE3250 
X-CRM114-Status: GOOD (  10.27  )
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

The kvm_riscv_vcpu_get_reg_config() should return the block size when
the host supports the corresponding extensions.

Fixes: 298276da73ca ("RISC-V: KVM: Zicbo[m|z|p] block sizes should be always present in ONE_REG")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 877ba823fc74..f2b125569449 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -50,13 +50,13 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
-		reg_val = (kvm_riscv_isa_check_host(ZICBOM)) ? 0 : riscv_cbom_block_size;
+		reg_val = (kvm_riscv_isa_check_host(ZICBOM)) ? riscv_cbom_block_size : 0;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
-		reg_val = (kvm_riscv_isa_check_host(ZICBOZ)) ? 0 : riscv_cboz_block_size;
+		reg_val = (kvm_riscv_isa_check_host(ZICBOZ)) ? riscv_cboz_block_size : 0;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
-		reg_val = (kvm_riscv_isa_check_host(ZICBOP)) ? 0 : riscv_cbop_block_size;
+		reg_val = (kvm_riscv_isa_check_host(ZICBOP)) ? riscv_cbop_block_size : 0;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		reg_val = vcpu->arch.mvendorid;

---
base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
change-id: 20260924-kvm_fix_cbosize-1bf2cdd282cb


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
