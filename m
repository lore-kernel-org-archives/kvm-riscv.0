Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D619606A320
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 11:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jdXjddt5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=GD3SbGDA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6PlSUXxEl2wbjKzC/vG+rz3QT7W6a04/cro0+Gvsc7A=; b=jdXjddt5n2Ix88ZnIuEtFUUoLD
	Pn614QiiKBJV4KByRzyMnUIxsJjMyyB54BRi/C8p1fWdcy28ZsIUYlT1zRnFt++Ukauu8izHlW2FO
	YoXyiiDLU7VHqnbuawy02NEejJmdxt2IDFUYVI0K7mtJv8IWAEuuoBJJTQ8wFOihHLfYMWXqJm/+y
	tmRFCreWaYnt9uGaLf19FlUxGRydRggXmHJkBcGZQ+/urc4CJzHCBwGyw4DBABh2KsSn8F34LhsUo
	wC7pVOWwVa763IoJG+VaLwElAyT280tmm2haBXOH40u/7203Ka0SIUq0pc7E/FuRUx3aqpKH6VzCS
	DWnP2v0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMk2-0000000EmY7-3d4V;
	Fri, 20 Nov 2026 11:25:18 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMjz-0000000EmX0-1pbG
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 11:25:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-491846221ffso594558f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 20 Nov 2026 03:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173913; cv=none;
        d=google.com; s=arc-20260327;
        b=Qn3Di8ce9jGTYOnnMUQYDDPCAC0n75njC1aWcMub4Jbf7LN6ZmsuNKBE7WMdUL8AMC
         SQuexLFNAi9pNTLyBP3peY99FbN7F6cF0zpWo9MDO9w78TG2dlEXN+Tfb4wstdsTZ/zM
         dmITeKKvOb5FtR4AIFFgkXc/12/O2sgnFDvkx9gPCoccAVn2+GtPILEr0H5iVfMyDzG1
         o28LOC2I5NNWzCFb2MP8BgxgV6MPLQdqHOaiejeJmZtiwxjpHCJAWAOF5P9pI6hYTYbs
         16i6dFAzpYd3GSizwSn9njNa/fEvRrkqeeJXbmFzmECV/aVPBSoPM7ENr6bxh3C65eHL
         wqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=T/oeAUI0ByDf7dPHx/8xzMZxbOAspRa0FQ1QEHteMRw=;
        fh=nI+EJCrkZ/vPPxZVAWvCeUKJ8wPoIC4QTJ2vU4IVdhc=;
        b=nB8vIPQc02pquGkomWhx+/3FcRqlToJP/zEXdtLw1PX2oahRVKj8IyODFqLfNID4nc
         pTWIBPONflqiE8EhKD3UPy1QI2QQndC+kkpvmi7thPf4K6h88XFdcJfSWEkMagJ5Vioj
         D7EqBYP3MmMaClh/4rH7t4/C+K3OLuZmfyWYtnk9PAKBgX0gjNAXSZS/Ycq12o925xME
         LvGgktxrDv7P3MDnPP1fZLbNyrzghrcwM7ro9HAokjxl3cCgwaRqWBuq+4VXo+BVKsSW
         tzvko/gQSMnPKYX5TDI2iBrSOEYcUfTbfl5TJHFGl8D/2OWrrGspUA+NegKi94hYF9g1
         yVJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795173913; x=1795778713; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T/oeAUI0ByDf7dPHx/8xzMZxbOAspRa0FQ1QEHteMRw=;
        b=GD3SbGDAp3bdQI7woH7MbmcAGXpXTLHO/4u1JWZaKiOOdRTbRSF6h/jYSarMWZSzFk
         ln9ZSNlKST6ew+fZnD5tWVbQso5pEvD+T+8LSfJZ2fswWK3eEOqR5vyQicrwPcNIHdxu
         cPXewFcOlpU/0Ykb4hUqO5YEHbzbmFnHRxG06Fmm68kXWOSBlRsemFRDe1u0x1D/JjlV
         zNSx8VQZ51wZ5bwyScVhuFpgrkg/VdFFTGAEvLD9L+CNxqyzHYCk3Y6TGBqqwuzaOphE
         8XgR7L/bRm/7Txk/E7MF3Zfc9GTD3R75TssFEuh+6gl52nUujAqJyB9YSsdDZEPBJ0XN
         AYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173913; x=1795778713;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T/oeAUI0ByDf7dPHx/8xzMZxbOAspRa0FQ1QEHteMRw=;
        b=X3PKlMVKVpyTg4VEvtSCfK581kwNSU19pB+yMe3fuwJzof4T/iJ3gpXDBEwsR24hyE
         1ufOB9BtcjTFK9sZZW5jRkph4Nq+k/1IJhyVvJJlq73rMm4L9Bkz7BlvjKdqfW/XYz5H
         C+LKeQ4hYZvWa7qT7aswG2brFcRNlUmC893IwZ5+QKkQG9BVb2b2IGzcwkw/eMZsAkvo
         yMdBly1UoD2LhOJTtxKbpHcnQmLZxc4Ei/ujC/K3J6aodheOy3UmlbZ8eiTpIOOXtQaT
         5W+lMitU2Ku0PYgrUbS2Y4l6RrISDwaLwD0xjXf1Z0zrkF4EawHi1WypzQ/DK8sThc/F
         81cA==
X-Forwarded-Encrypted: i=1; AL+hErGCrZQe07gY1nyFk8H9N//NpJVLSqjAXrW4njfVNXSRw6GHFgRavrCk9m2brF23QkVAea1oTooHNb0=@lists.infradead.org
X-Gm-Message-State: APuU4Z8hO99SCmWPIO2QYsIOOGBvZIU2g5R4QRHA8r5a1nqf1UiRUy5C
	NFCxSmBfV/A5koMKtPCzALJJNsybJbKG34Z3eUtP625+uJcOtfcAN2jJ2Dp39LM5EofBEj9s6kW
	OBG3ajKXXJp8pFMkkdIMGdLANl5YUPqPbxxI+wWJYXw==
X-Gm-Gg: AZFdTZcInYjc7Mx6M7rQ+Wq/xx1GzUDJmRZDQpZRJjAsahQaKnLp6My6IpSFJlyivI0
	u6QYkWFrznxI/qc4DoASlivl0IRXfZ0AN/4TGBxU2xsI+fT0CKGVffPXxP6eRNRFbSasd9e9RcU
	2/SXV7eZjJBuclYx2jykLplWUxEFc0ZxhHS1vFWhFIlib0YDYGkNJn/ProsdVEoC/e4w3N6HsHO
	50d5+V+vVToPYojNCyZ0HfJjN9fWMz6RRapfe1tzj2M2NGXvaAv2CmMuulJ9+9ueD5UBjM7KNXp
	C67XJLTxqx+Zo2bC3tbHEJiso+NU80MwaLrNy9x+zacJHNiM897h+tD6MvOo9uq+xfL14mBlXjY
	CmmHt63vykH4G7BSjLo30krxlkMZIJ9i+It02tr1li1OKE0p9uokFIa443TYvEShOBTpnp5I7fM
	qmWO5fIlheYHTS4WlXs3zKr45QB8H5J6VE+sOM1ZNmbh5UVy4OqAAG/UmTHUP9r8Eviulj/WKOr
	A==
X-Received: by 2002:a05:6000:2489:b0:48e:2108:4d28 with SMTP id
 ffacd0b85a97d-4abb1baaa3emr5589260f8f.13.1795173913277; Fri, 20 Nov 2026
 03:25:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Nov 2026 16:55:01 +0530
X-Gm-Features: Aa3M54oHwQOVnudG2qxplu2UhUX6GqklCT0V-Jph6298Y8vWTvDHUntIEuLbZcc
Message-ID: <CAAhSdy32nAjcz2vyN37Fb7nKc9jbUxWjUYjiYGda7NPhweJhTw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 7.4 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_032516_026709_FB19A3DF 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Paolo,

We have the following fixes for 7.4 kernel:
1) Validate AIA MMIO address ranges before AIA is initialized
2) Disallow GPA-width changes after AIA is initialized
3) Fix double free of the split page cache
4) Do not touch the envcfg CSRs on the SiFive P550
    (Note: SiFive P550 is based on Priv v1.11 so it
     does not have envcfg CSR hence this fix)
5) Set Accessed bit in dirty-log write fault fast-path
6) Validate PMU counter info using available counters
7) Fix G-stage page table memory leak on VM destroy
    (Note: This one was a pretty embarrassing issue
     which we totally missed over the years)

Please pull.

Regards,
Anup

The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:

  Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-7.4-1

for you to fetch changes up to e9bf49bbc4227048685c78f97e1446845760df4f:

  RISC-V: KVM: Fix G-stage page table memory leak on VM destroy
(2026-11-16 18:06:25 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 7.4, take #1

- Validate AIA MMIO address ranges before AIA is initialized
- Disallow GPA-width changes after AIA is initialized
- Fix double free of the split page cache
- Do not touch the envcfg CSRs on the SiFive P550
- Set Accessed bit in dirty-log write fault fast-path
- Validate PMU counter info using available counters
- Fix G-stage page table memory leak on VM destroy

----------------------------------------------------------------
Davidlohr Bueso (1):
      RISC-V: KVM: Do not touch the envcfg CSRs on the SiFive P550

Li Jinyue (1):
      RISC-V: KVM: Fix double free of the split page cache

Pengpeng Hou (2):
      RISC-V: KVM: Validate AIA MMIO address ranges
      RISC-V: KVM: Disallow GPA-width changes after AIA init

Qingwei Hu (1):
      RISC-V: KVM: Validate PMU counter info using available counters

SeungJu Cheon (1):
      KVM: riscv: Set Accessed bit in dirty-log write fault fast path

Yangyu Chen (1):
      RISC-V: KVM: Fix G-stage page table memory leak on VM destroy

 arch/riscv/include/asm/kvm_gstage.h |  2 ++
 arch/riscv/include/asm/kvm_host.h   |  1 +
 arch/riscv/kvm/aia_device.c         | 49 ++++++++++++++++++++++++++++++++++---
 arch/riscv/kvm/gstage.c             | 22 +++++++++++++++++
 arch/riscv/kvm/main.c               |  9 +++++++
 arch/riscv/kvm/mmu.c                | 12 ++++-----
 arch/riscv/kvm/vcpu.c               |  6 +++--
 arch/riscv/kvm/vcpu_config.c        | 16 +++++++-----
 arch/riscv/kvm/vcpu_pmu.c           |  2 +-
 arch/riscv/kvm/vcpu_sbi_fwft.c      | 20 +++++++++++----
 arch/riscv/kvm/vm.c                 |  5 +++-
 11 files changed, 118 insertions(+), 26 deletions(-)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
