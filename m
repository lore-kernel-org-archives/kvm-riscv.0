Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEEAC3ABC9
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGQRYtVZJaZk8lHoQ68vZvOW4wIYj4Yg+m4X2lU7IKg=; b=1u3WOjfGkm5dr3
	5w/3bdyyu4FxQXIfl23v6RzMuQHfcuMfm7nAmstOTBgeZkB0q3wIO0mKr7YNMILjhMhE7NmcXBeH+
	yKsW4hIJtcPIEt6Hz/+y8erIUguIY6rVs9N3QqoaYA0+MAXTdeVyoJdhVQ4MWRP717ogT99oWqx5X
	DrET7Z3nFtktWtQ1ZhlFgH2oacV+u5R4Rk3oYtWJ4KRxD0BO636O2WzOpO8F9my/cHtfTQeHPLhuu
	ROaLe+SBw9o52uRPtb3IoobqobHd/pxJpNiNWEL4D2M5LJvcKixJexYMxbAetWXuKjay6h4pYy7Kl
	5t4sxJOZlreFvuHneeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyF-0000000HXlx-0DbV;
	Thu, 15 May 2025 08:29:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTse-0000000HVin-1p7F
	for kvm-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso6862995e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297430; x=1747902230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=;
        b=V+3BImXCxk3DQMR70EuSpcxolcNFLr2n7DUlkMEPUk8RqZjcSYxl0kK7I3Ffkb434n
         3yYzRXc0LbhpAIdm7cgPSipbZ1rNXuDMgxnexsT6RD6lhKAznC/iK+sBDoNX0fQYpQV1
         +BFDFSMiFYZ5xuGk7NNZ8GjIZ7oV5E+UwEaCZ/CPljjYEp2VpUV4J9PDe4wmQgDFbO3w
         cstv1o/22l9Kc3j+ljL2VIP9L2m2r1Zx4Zs9kgO26uvzbsliDt7CPT14+xvABLWukO8+
         L9d291adt+/dawO3kOyysTMnf6ZWWNhdDC+r9a4E5RhfiQplBVSFJeo+vIREIdvIE8BA
         2KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297431; x=1747902231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=;
        b=jGGR3vyiL2CYCPdHHk0NEg1wnJ/zrxS36IhQdKzR2kOEoJ1Ge3JF/rlR7rZn7vmrx1
         6zBBlfpZ8VgLJ7z/XUsDmCRw5rOO0Gi42Ak63aLTx8DfxyHXbXrp8eENIOE/yH57SYI1
         hwHZYOVL+kLa5MQ54fdluQT/kLqLio/47mCMPATfuZREWRs55+yuX1JROJmxXm/iWl1p
         5QyXU2lP79slrEIlpEZEo+hSjYftrbzv6bA3R3ICUqb1GRHBZwRaXVU49NhSBxfGpbzY
         mM0eqElXW6XDN4mUit3mrhsdiVZ+NG29Qf6MPxm+pz8IVW83C7A+Who/wy2ssLejBn2O
         PgTA==
X-Forwarded-Encrypted: i=1; AJvYcCWNYDsp+Q5Ij6SQsv1Ztnum4cx7nX2yss+0V0T/lpYs38mFDZsnFn6AKk4JXxYQGg2okaw2WyQHQwo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/V+QI+WGCvSzO5Cv/qtb4g7NxHC1Mlr/LKmy+uI+1wXx8pk7l
	lcpV0krAclXCyS+2r+UxfVJb6GpicQTJRqGOC9sNA/P5vDI7Hsqs3g9Sv4Q8P5E=
X-Gm-Gg: ASbGncuDGd2h8oQitnF4SQ6pFia+Rb0sU2KW92gHLjqngd3OAGxpZFjaAe+1EALGCV4
	yBkZDnVw8e9bNKqU+Gsq6ITVNMAwseJE94BvERGY81gzWbif0TbxTy/BSAlotpslebfUgN4hVn1
	ZyC8qoljxevNbAvvHg61vX+niqDnMYNboex6SpVvjGwoyGDsc7/bqekOlaIrtX3T8lTE5YnpJKX
	mVLXrbpYhc4O1eBHVm8o66QiJyNp12HbkyHFRTraxLKbO0sa3ZLrtxPjb4iEcjHaqxq3wfXnM1K
	WJNMyCj0DwY3A9TEfaGcxuiSMZtrDnZx4r/uY3XG7xPqyq096hI=
X-Google-Smtp-Source: AGHT+IHo18Wz0xfwowIAkjj7FGe8ulZGDuitOfmnOSRcK7rM7RV/Qat3DxuhXQ8uvVsICI2vUu48rQ==
X-Received: by 2002:a05:600c:8411:b0:442:faa3:fadb with SMTP id 5b1f17b1804b1-442faa3fbb1mr9904825e9.2.1747297430595;
        Thu, 15 May 2025 01:23:50 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:49 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 05/14] riscv: sbi: add SBI FWFT extension calls
Date: Thu, 15 May 2025 10:22:06 +0200
Message-ID: <20250515082217.433227-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012352_495211_04DEB499 
X-CRM114-Status: GOOD (  13.34  )
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

QWRkIEZXRlQgZXh0ZW5zaW9uIGNhbGxzLiBUaGlzIHdpbGwgYmUgcmF0aWZpZWQgaW4gU0JJIFYz
LjAgaGVuY2UsIGl0IGlzCnByb3ZpZGVkIGFzIGEgc2VwYXJhdGUgY29tbWl0IHRoYXQgY2FuIGJl
IGxlZnQgb3V0IGlmIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+ClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNv
bT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDIwICsrKysrKysrKysrKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMK
aW5kZXggODE4ZWZhZmRjOGU5Li41MzgzNmE5MjM1ZTMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NiaS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCkBAIC0yOTksNiArMjk5
LDggQEAgc3RhdGljIGludCBfX3NiaV9yZmVuY2VfdjAyKGludCBmaWQsIGNvbnN0IHN0cnVjdCBj
cHVtYXNrICpjcHVfbWFzaywKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGJvb2wgc2JpX2Z3ZnRf
c3VwcG9ydGVkOworCiBzdHJ1Y3QgZndmdF9zZXRfcmVxIHsKIAl1MzIgZmVhdHVyZTsKIAl1bnNp
Z25lZCBsb25nIHZhbHVlOwpAQCAtMzI2LDcgKzMyOCwxNSBAQCBzdGF0aWMgdm9pZCBjcHVfc2Jp
X2Z3ZnRfc2V0KHZvaWQgKmFyZykKICAqLwogaW50IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVyZSwg
dW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncykKIHsKLQlyZXR1cm4gLUVP
UE5PVFNVUFA7CisJc3RydWN0IHNiaXJldCByZXQ7CisKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRl
ZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCisJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfRldG
VCwgU0JJX0VYVF9GV0ZUX1NFVCwKKwkJCWZlYXR1cmUsIHZhbHVlLCBmbGFncywgMCwgMCwgMCk7
CisKKwlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0LmVycm9yKTsKIH0KIAogLyoq
CkBAIC0zNDgsNiArMzU4LDkgQEAgaW50IHNiaV9md2Z0X3NldF9jcHVtYXNrKGNvbnN0IGNwdW1h
c2tfdCAqbWFzaywgdTMyIGZlYXR1cmUsCiAJCS5lcnJvciA9IEFUT01JQ19JTklUKDApLAogCX07
CiAKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCiAJ
aWYgKGZlYXR1cmUgJiBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQpCiAJCXJldHVybiAtRUlO
VkFMOwogCkBAIC02NzksNiArNjkyLDExIEBAIHZvaWQgX19pbml0IHNiaV9pbml0KHZvaWQpCiAJ
CQlwcl9pbmZvKCJTQkkgREJDTiBleHRlbnNpb24gZGV0ZWN0ZWRcbiIpOwogCQkJc2JpX2RlYnVn
X2NvbnNvbGVfYXZhaWxhYmxlID0gdHJ1ZTsKIAkJfQorCQlpZiAoc2JpX3NwZWNfdmVyc2lvbiA+
PSBzYmlfbWtfdmVyc2lvbigzLCAwKSAmJgorCQkgICAgc2JpX3Byb2JlX2V4dGVuc2lvbihTQklf
RVhUX0ZXRlQpKSB7CisJCQlwcl9pbmZvKCJTQkkgRldGVCBleHRlbnNpb24gZGV0ZWN0ZWRcbiIp
OworCQkJc2JpX2Z3ZnRfc3VwcG9ydGVkID0gdHJ1ZTsKKwkJfQogCX0gZWxzZSB7CiAJCV9fc2Jp
X3NldF90aW1lciA9IF9fc2JpX3NldF90aW1lcl92MDE7CiAJCV9fc2JpX3NlbmRfaXBpCT0gX19z
Ymlfc2VuZF9pcGlfdjAxOwotLSAKMi40OS4wCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
