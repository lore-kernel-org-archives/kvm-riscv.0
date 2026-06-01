Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CE5CD6E61
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 10:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lu8/y4d49JyBk+3/a8HSWlNJuxrEqVV/iDJRVbWEk4U=; b=OhwicOjOnr+++7
	gtDE8AVTC9Ozx6XYb4h2Wq+qbRBhPIPE31LFvb8VrTzUXosxGCTZJXYB615cPFLmCQ4rfLMdNKx+6
	ed9ozjVD3VP/fhBpbbkBiZZvvUv/fx+DNMr77r6hUe1tGM1tvPYY1SoH2dzQNNF0/BDk1s+P4d5cN
	X1XAPDviVG6Y3IWJKi1ok0IwPyJUQwMx5YuzSGh/uhEIYxXoXjyEmYqdCYSdD32JxzzLP0F0cKDMu
	sI8JyudRZ+C0KSceA0xzBKxGhFYmh5kvbZyMNpCkM59XX08tOuJqbjHCtQLT30hVQlH5qmpv/d4ZD
	3BOhxgm9BnEBMTRF3a6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzqz-0000000Ac5H-3caS;
	Mon, 01 Jun 2026 10:26:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzqz-0000000Ac4E-0ZYp
	for kvm-riscv@bombadil.infradead.org;
	Mon, 01 Jun 2026 10:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vZcJSSPPDZRD9m7u0WYcrKJNavTPlRfNheNSPldKeYQ=; b=jD/aeh0g2kQepaUXC+ftDNwYy3
	CuarV7epybU6Fw3n7W3ZgSVB7RvCnpQ5JdIi3fl0B6WG5CxO/FVib1Pkrdk6Ph/IhB7pOYaKoFvuk
	WwH//wMtB5nEcSFtP/mSFjNV/UZz+HzZH+t8u39JvimpN1qZacF/Vbd1HuVhTfhwICen1xZmLNsWd
	5zkeyGnk+43QyNQE2DF8rrIDghgA6Nz+J7NFhPDUI6lqtgl8PQ89koKtuRG9ucBU8BG+XVY6bqv0O
	IXGczGI5orOXG4sDOt90m7PimePEyCAjUxF410ZjvLICUcf/yGC1/rNWY2xxnKpl9X7JbhMdHs9jL
	0F3v12lQ==;
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzqv-00000006Nm2-2W1L
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 10:26:39 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-136b46c3540so9939783c88.1
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 03:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780309595; x=1780914395; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZcJSSPPDZRD9m7u0WYcrKJNavTPlRfNheNSPldKeYQ=;
        b=lbEAtvWxjZuzCnb+TVp3xIXQWJYq1g72/Z7SN0CKxdfUw2EQzGc5iF8Ixr/FS/64Tg
         G1C1ksE4qhDAdktRDa+xtygUjT9XE2ObQQIUV8UiR9prEP9Cv8Sn8cfYdz0U7lmH/Pnv
         OtgEFX7XiNDW6Q0q+MmPqTZmO/NLdPEHzH0GflDyJ5m6YeHw9MTrv12bx6y7CFZnnvrW
         RQnpQ/JTV8HRp75GLZ3C2jnOMnXs64SJO225e0A/8ZyUx5eUdvLkFTMdm82dq6qnDpxN
         1kYv4ymrIJ++8ia/mpSI+m+WRZl2Eets9aETNC70apKYX/dHRnFE9b9iRcrGku/TExDO
         xJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309595; x=1780914395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vZcJSSPPDZRD9m7u0WYcrKJNavTPlRfNheNSPldKeYQ=;
        b=ZRdNXuOD29Rrqy0PQ0yTnUJos9IZ9+c82NfYOSXIpFUaaLX1uxjQX730OhWZ/i2kOl
         VMzmSzTwqBaRdJEqt+4KJngyXdxlfjFI99C/TPAYdmhA3XHo6xd54eILJ9OMt4pDR0GX
         PF74tyvXdwqXlyFOrSOY3sBVMxI84ZUSDKPe4nnfgZrPBPT2irTCJT7f+xaMx2DbipIo
         /Xy2Rf0ctV6PK2TAmfaYZbOg5JtCFOGEqyymybFeHYuPthVKGEZDNOCWtOfSrLh4yeX8
         k/JjUg0QAvftnIQnJxO1fCevgXLMP2+5KeCXtQioOZv0SjkllBVrADsd3Tw88iJ9idmy
         WUBg==
X-Forwarded-Encrypted: i=1; AFNElJ9RSX8pHe1NWsiyw+lGxHXwSP0dH1pPAJlzfBy19VXu2hXZ+AVvCXMjtNZ2G+xbpXXqMcfN36vR09g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9LgEcUJ00qnpSsK7PLLiluDYsDDqyEehZmznv/Y9yO80SHh65
	gDtRbequis0fHxTUSnh0w/yR+7r4Qtl35R0OKhofTAHG7cTcw4c5QD7ejizBX+t3NJpMnr6mWGC
	QZ2AnK6o=
X-Gm-Gg: Acq92OHx//7MLsm/4FWTOsdOmfzFhdBoBNx79GaruhalkixAZOJGFLuP/6ozlJBs6qH
	03MjzG5IJvemoocDxuB8Ebl6H3He2LVNipMKzEbtZ8D0S16MZ9zpg1xuoJRap7SGuCmkpWeBRil
	OgjEdfYJMfvFdJTawzPTn4n3bZQNcIdZzFeQfUG+b1kxrPr4J9msmZzUqTqnJUSTmuvzh0Pat45
	z/axOZZImY9Jm//bSnU83ukSmDwzGt0Z9lEGicFHiQJdFGQbgIx1omfSzLIIxf5UoVEnYcoymvv
	EIyzHH3N+sm703w1znFzbF6/8a9pnALGOyZYFsX08BNVcvSL8jIr6HmvjbLm0pCfA/6AU95MLmg
	O4/ljtXfZJRXnkSPXeTgNO68/vkUAUBXDwnQberda6OhA9JZ3Oflal4D/vNRH2GuxK2aHy8qPWq
	kz1Wn9DHhVySPhWVyP6ZhgmzTkiC1Jv2KRQfsf+qAeVZnM/TPPpVK5Pw==
X-Received: by 2002:a05:7301:1695:b0:304:de94:1c2c with SMTP id 5a478bee46e88-304fa75092dmr5279923eec.34.1780309594882;
        Mon, 01 Jun 2026 03:26:34 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5b9be7sm8176001eec.27.2026.06.01.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:26:34 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 01 Jun 2026 03:26:22 -0700
Subject: [PATCH v5 1/5] KVM: RISC-V: SBI FWFT: Mark vCPU CSRs dirty after
 setting feature value
MIME-Version: 1.0
Message-Id: <20260601-kvm-get_reg_list-v2-v5-1-415d08a2813b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780309592; l=970;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=XMF0XSIyNuy4j6kTqZpEJUq1eyLTItJ7528vJLaFCY0=;
 b=i4mw/AFm7VlveGu7MUnkidG4GqKblWsIvDKpDapvBtMbjsymQ2BViwqrFhpQVOJj/B8/0HHfM
 1eIuk0srt6vBTpBQi2sl9VIkC6pNQBVnanp9bwOiLrdd6aUCUVh1h+H
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_112638_159294_645E52E3 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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

Mark the vCPU CSRs as dirty after successfully setting an FWFT feature
value. FWFT features may modify CSRs (e.g., pointer masking modifies
henvcfg.PMM), and failing to mark them dirty can lead to the guest
observing stale CSR state after vCPU scheduling or migration.

Fixes: 1323a5cfe52c ("KVM: riscv: Skip CSR restore if VCPU is reloaded on the same core")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 2eab15339694..5e4aafb0cbf1 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -521,6 +521,7 @@ static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 		break;
 	case 2:
 		ret = conf->feature->set(vcpu, conf, true, value);
+		vcpu->arch.csr_dirty = true;
 		break;
 	default:
 		return -ENOENT;

-- 
2.43.7


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
