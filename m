Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F11EC3601E
	for <kvm-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNW3xHC/IkUfTgqfURau3EhAAdkoRH+oTsQk9IJ5IfQ=; b=exkWOTRdCWpPLB
	EFVnWeytYF2UAl78MZ2wOa7rnStLAMbjP8DvyDfbsSquxnoCVZJeE2sSBjucG7CwvwzhO/vlFj61k
	7Wzda9D67Ajtih5aht4gqvD1vZ9Kur3Wuy2tdYHX2Tqp4g4vVqgpxG2Qram89PeymCB59wl5X+SvJ
	HQrR6mrbZhsNJcC9P5+QlHAJq4kz4NPM8f95GRnXeC54wiKN9kbamS4Wfrn3siND9XqCTPFENK7ib
	nkRQrV8IkEeTyhxG8kLTZQnQ+cENWvjO3QZ5H3CcRWbZb5VO5me7IrDniVxNDcZvqvM3mNqe2upBY
	tPttEoXlF8Abs8n87s0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ItC-00000008jRz-3Jx4;
	Thu, 03 Apr 2025 11:37:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Inu-00000008iRa-0jIJ
	for kvm-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 11:32:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39ab85402c9so54909f8f.2
        for <kvm-riscv@lists.infradead.org>; Thu, 03 Apr 2025 04:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1743679932; x=1744284732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+bBWXikjKTcV8ccgilNOkXVbdx4GamWUb2bvML3ssQ=;
        b=ELm21eeUys2t2LQKRh+jVvqI9OmFG8T0IrmcVWPC3AOpo6B3suoQb7Sry5Fbg8MhvW
         +hundhwJce9BUmc/A6ABgNa4m0XTA1l24SVdAzjVu/Skw54Q/l1aI9nRCyzg/W9xefw9
         +2CGc0/0BqAbIwuw60dMvNMiOiOTh4mnxdXC6j75z+3YgNFOhAQXkMbDV12PYFX/SDhr
         7mypLBPGV85mANN8sbxRsPWWYWbKmPoZVYyrgRhxD4qMsLiFdm4K/aoz07kTdpuBLLya
         r+2cln5Myn6q0FFW0XwDD1XeZErdhRbHw4CU2hzNTQV+x+1qCnMnx0J0cshwavfUpU04
         fC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679932; x=1744284732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+bBWXikjKTcV8ccgilNOkXVbdx4GamWUb2bvML3ssQ=;
        b=rYpb/0zP9SeeXkaM5uWQkhXQ5EVW2U0GTUDz30On59MlKKx0Tftk7Tc5SohkeqWHpE
         nS9Dpw+BW+NqrvFV7XAOyKildalNP3b96xU2OwDUH9ca5FwHxmaYqGFgxzOdjZkQePOF
         YLRGjb5y4GWMg9nPtmDb0wQ02X5bQra5RiJkVMcswWp+OrzNJMF6ngluropFOBWC1R3D
         uZo1uzb531E5DpTAgNYzakAH7jj9T7jzJWMcIEfUlfX0dq7VRDUX4PjTH0hBgNzaXs/X
         2H9uaSVDQMYq2DGuatSttFsTAW6LFHj443HI4YJBqnzZDrt/UrmB9iPUvpzwv0JeRJwP
         AM7Q==
X-Gm-Message-State: AOJu0YxLuwCGGoHqRcILpcsa5jTv/jVFx5yd0NwbyKast2pGnW5wqTSV
	w0iHKu1m1v1gSl5pZ5K2X2M5McjFLeJqNMl70Rf+KFqw01V9OMiIXiAi6RGiApfng8Y5D6TARqO
	S
X-Gm-Gg: ASbGncug3Y3EV/d4XrpHa3SxM4jH/JxHCxH82iKKOUyvnDKTBNhScHPmSzJS4HH4Kyo
	4Cu6fWkAFxjPnh0iVxGzpJpFSmEDuHdS8rZlJ2IcGgxxCY4eozW2iV7olM8Iuv+Lk791+3yCDpa
	qglL/ApxyBjCj0H3yqdbOQP7DT649FaMAeXfOZ6s3LJ/uim3gO2H44l/r9ykyHfSMFtGXrVC1sA
	qwVBiIwhfnmMW2kXhUQCpAcDvKLMNZrluLyq0myJWSZczlOtfBH1YW6Fq7HPcSwwIAJV8kglJIq
	ClKPLLosTt1tfYQW2MePkhsU6NqVHTCJjpi8fOyyO3Dl/0F2iFRFMNBQdR4QyC6bpEF7ApPxXPA
	kKQ==
X-Google-Smtp-Source: AGHT+IFKuI/VQYzBaPbrBORZ5Fz1t5HIbnJ+TER1Sbfneisom4goMlCFQ2arAW6gwbRupN7/O0Rx8w==
X-Received: by 2002:a05:6000:144a:b0:391:29ab:c9df with SMTP id ffacd0b85a97d-39c2470802cmr3357803f8f.4.1743679932289;
        Thu, 03 Apr 2025 04:32:12 -0700 (PDT)
Received: from localhost (cst2-173-141.cust.vodafone.cz. [31.30.173.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366a699sm15541695e9.38.2025.04.03.04.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:32:11 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH 1/5] KVM: RISC-V: refactor vector state reset
Date: Thu,  3 Apr 2025 13:25:20 +0200
Message-ID: <20250403112522.1566629-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_043214_225837_0D79C4EA 
X-CRM114-Status: GOOD (  13.62  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

RG8gbm90IGRlcGVuZCBvbiB0aGUgcmVzZXQgc3RydWN0dXJlcy4KCnZlY3Rvci5kYXRhcCBpcyBh
IGtlcm5lbCBtZW1vcnkgcG9pbnRlciB0aGF0IG5lZWRzIHRvIGJlIHByZXNlcnZlZCBhcyBpdApp
cyBub3QgYSBwYXJ0IG9mIHRoZSBndWVzdCB2ZWN0b3IgZGF0YS4KClNpZ25lZC1vZmYtYnk6IFJh
ZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgotLS0KIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX3ZjcHVfdmVjdG9yLmggfCAgNiArKy0tLS0KIGFyY2gvcmlzY3Yva3Zt
L3ZjcHUuYyAgICAgICAgICAgICAgICAgICAgfCAgNSArKysrLQogYXJjaC9yaXNjdi9rdm0vdmNw
dV92ZWN0b3IuYyAgICAgICAgICAgICB8IDEzICsrKysrKystLS0tLS0KIDMgZmlsZXMgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX3ZjcHVfdmVjdG9yLmgKaW5kZXggMjdmNWJjY2RkOGIwLi41N2E3OThhNGNiMGQgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfdmVjdG9yLmgKKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV92ZWN0b3IuaApAQCAtMzMsOCArMzMsNyBA
QCB2b2lkIGt2bV9yaXNjdl92Y3B1X2d1ZXN0X3ZlY3Rvcl9yZXN0b3JlKHN0cnVjdCBrdm1fY3B1
X2NvbnRleHQgKmNudHgsCiAJCQkJCSB1bnNpZ25lZCBsb25nICppc2EpOwogdm9pZCBrdm1fcmlz
Y3ZfdmNwdV9ob3N0X3ZlY3Rvcl9zYXZlKHN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNudHgpOwog
dm9pZCBrdm1fcmlzY3ZfdmNwdV9ob3N0X3ZlY3Rvcl9yZXN0b3JlKHN0cnVjdCBrdm1fY3B1X2Nv
bnRleHQgKmNudHgpOwotaW50IGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKLQkJCQkJc3RydWN0IGt2bV9jcHVfY29udGV4dCAqY250eCk7
CitpbnQga3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KTsKIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfZnJlZV92ZWN0b3JfY29udGV4dChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwogI2Vsc2UKIApAQCAtNjIsOCArNjEsNyBAQCBzdGF0aWMgaW5saW5l
IHZvaWQga3ZtX3Jpc2N2X3ZjcHVfaG9zdF92ZWN0b3JfcmVzdG9yZShzdHJ1Y3Qga3ZtX2NwdV9j
b250ZXh0ICpjbgogewogfQogCi1zdGF0aWMgaW5saW5lIGludCBrdm1fcmlzY3ZfdmNwdV9hbGxv
Y192ZWN0b3JfY29udGV4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCi0JCQkJCQkgICAgICBzdHJ1
Y3Qga3ZtX2NwdV9jb250ZXh0ICpjbnR4KQorc3RhdGljIGlubGluZSBpbnQga3ZtX3Jpc2N2X3Zj
cHVfYWxsb2NfdmVjdG9yX2NvbnRleHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogewogCXJldHVy
biAwOwogfQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdS5jCmluZGV4IDYwZDY4NGM3NmM1OC4uMmZiNzUyODhlY2ZlIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2t2bS92Y3B1LmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCkBAIC01Nyw2
ICs1Nyw3IEBAIHN0YXRpYyB2b2lkIGt2bV9yaXNjdl9yZXNldF92Y3B1KHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKIAlzdHJ1Y3Qga3ZtX3ZjcHVfY3NyICpyZXNldF9jc3IgPSAmdmNwdS0+YXJjaC5n
dWVzdF9yZXNldF9jc3I7CiAJc3RydWN0IGt2bV9jcHVfY29udGV4dCAqY250eCA9ICZ2Y3B1LT5h
cmNoLmd1ZXN0X2NvbnRleHQ7CiAJc3RydWN0IGt2bV9jcHVfY29udGV4dCAqcmVzZXRfY250eCA9
ICZ2Y3B1LT5hcmNoLmd1ZXN0X3Jlc2V0X2NvbnRleHQ7CisJdm9pZCAqdmVjdG9yX2RhdGFwID0g
Y250eC0+dmVjdG9yLmRhdGFwOwogCWJvb2wgbG9hZGVkOwogCiAJLyoqCkBAIC03OSw2ICs4MCw4
IEBAIHN0YXRpYyB2b2lkIGt2bV9yaXNjdl9yZXNldF92Y3B1KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSkKIAogCWt2bV9yaXNjdl92Y3B1X2ZwX3Jlc2V0KHZjcHUpOwogCisJLyogUmVzdG9yZSBkYXRh
cCBhcyBpdCdzIG5vdCBhIHBhcnQgb2YgdGhlIGd1ZXN0IGNvbnRleHQuICovCisJY250eC0+dmVj
dG9yLmRhdGFwID0gdmVjdG9yX2RhdGFwOwogCWt2bV9yaXNjdl92Y3B1X3ZlY3Rvcl9yZXNldCh2
Y3B1KTsKIAogCWt2bV9yaXNjdl92Y3B1X3RpbWVyX3Jlc2V0KHZjcHUpOwpAQCAtMTQzLDcgKzE0
Niw3IEBAIGludCBrdm1fYXJjaF92Y3B1X2NyZWF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJ
Y250eC0+aHN0YXR1cyB8PSBIU1RBVFVTX1NQVjsKIAlzcGluX3VubG9jaygmdmNwdS0+YXJjaC5y
ZXNldF9jbnR4X2xvY2spOwogCi0JaWYgKGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250
ZXh0KHZjcHUsIGNudHgpKQorCWlmIChrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0b3JfY29udGV4
dCh2Y3B1KSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAkvKiBCeSBkZWZhdWx0LCBtYWtlIENZLCBU
TSwgYW5kIElSIGNvdW50ZXJzIGFjY2Vzc2libGUgaW4gVlUgbW9kZSAqLwpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9y
LmMKaW5kZXggZDkyZDEzNDgwNDVjLi5hNWY4OGNiNzE3ZjMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfdmVjdG9yLmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwpA
QCAtMjIsNiArMjIsOSBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X3ZlY3Rvcl9yZXNldChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpCiAJc3RydWN0IGt2bV9jcHVfY29udGV4dCAqY250eCA9ICZ2Y3B1LT5h
cmNoLmd1ZXN0X2NvbnRleHQ7CiAKIAljbnR4LT5zc3RhdHVzICY9IH5TUl9WUzsKKworCWNudHgt
PnZlY3Rvci52bGVuYiA9IHJpc2N2X3ZfdnNpemUgLyAzMjsKKwogCWlmIChyaXNjdl9pc2FfZXh0
ZW5zaW9uX2F2YWlsYWJsZShpc2EsIHYpKSB7CiAJCWNudHgtPnNzdGF0dXMgfD0gU1JfVlNfSU5J
VElBTDsKIAkJV0FSTl9PTighY250eC0+dmVjdG9yLmRhdGFwKTsKQEAgLTcwLDEzICs3MywxMSBA
QCB2b2lkIGt2bV9yaXNjdl92Y3B1X2hvc3RfdmVjdG9yX3Jlc3RvcmUoc3RydWN0IGt2bV9jcHVf
Y29udGV4dCAqY250eCkKIAkJX19rdm1fcmlzY3ZfdmVjdG9yX3Jlc3RvcmUoY250eCk7CiB9CiAK
LWludCBrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0b3JfY29udGV4dChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsCi0JCQkJCXN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNudHgpCitpbnQga3ZtX3Jpc2N2
X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogewotCWNu
dHgtPnZlY3Rvci5kYXRhcCA9IGttYWxsb2MocmlzY3Zfdl92c2l6ZSwgR0ZQX0tFUk5FTCk7Ci0J
aWYgKCFjbnR4LT52ZWN0b3IuZGF0YXApCisJdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rv
ci5kYXRhcCA9IGt6YWxsb2MocmlzY3Zfdl92c2l6ZSwgR0ZQX0tFUk5FTCk7CisJaWYgKCF2Y3B1
LT5hcmNoLmd1ZXN0X2NvbnRleHQudmVjdG9yLmRhdGFwKQogCQlyZXR1cm4gLUVOT01FTTsKLQlj
bnR4LT52ZWN0b3IudmxlbmIgPSByaXNjdl92X3ZzaXplIC8gMzI7CiAKIAl2Y3B1LT5hcmNoLmhv
c3RfY29udGV4dC52ZWN0b3IuZGF0YXAgPSBremFsbG9jKHJpc2N2X3ZfdnNpemUsIEdGUF9LRVJO
RUwpOwogCWlmICghdmNwdS0+YXJjaC5ob3N0X2NvbnRleHQudmVjdG9yLmRhdGFwKQpAQCAtODcs
NyArODgsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LAogCiB2b2lkIGt2bV9yaXNjdl92Y3B1X2ZyZWVfdmVjdG9yX2NvbnRl
eHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogewotCWtmcmVlKHZjcHUtPmFyY2guZ3Vlc3RfcmVz
ZXRfY29udGV4dC52ZWN0b3IuZGF0YXApOworCWtmcmVlKHZjcHUtPmFyY2guZ3Vlc3RfY29udGV4
dC52ZWN0b3IuZGF0YXApOwogCWtmcmVlKHZjcHUtPmFyY2guaG9zdF9jb250ZXh0LnZlY3Rvci5k
YXRhcCk7CiB9CiAjZW5kaWYKLS0gCjIuNDguMQoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
