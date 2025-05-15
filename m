Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E582C54754
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EV6y2CSSi57S8XNDNdKyBXPaZ5RredSc8mZFL6HknCE=; b=FMljcnAtFPa5ST
	0YzJns/PaLLsfDJfUn03qg0ZHMs3zKmjINdxHs3hBYyatRv7m7s8lPx4nlxylQ7G2Kaujwx6F/B/y
	qiZkqb6z+T6vNgsJgAdd0FpNejsW9wTKiNF84KPUzz40ExitV0nPCTVg/DOjIi5gVWcGGGwiXO8/U
	vxskGSYdiwv2IdZK1a8Rwb+9fkyog+P3ptZLNLr+jvXS1KMzsA3jjTyR4+KyCDrJqZkQrtGXneQQl
	oSZAmCUep/9HwF+p7JS2PM+VxmVYv7KG6fEHSmOO8srh4hpUVS6ujkwHJcpxbdRpqaUwVQbYLFkbx
	6+6oe/FlF2G6MK44qPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyS-0000000HY9F-2FZq;
	Thu, 15 May 2025 08:29:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTso-0000000HVr7-1sva
	for kvm-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:24:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso4681575e9.3
        for <kvm-riscv@lists.infradead.org>; Thu, 15 May 2025 01:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297441; x=1747902241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HRRvwQZR7OY0o40CF4iX42SSRrEHUJjKFBagu/MDOQ=;
        b=tM9kGNf23Olg97SpHZVZD3vie8m3raNe4o55ABXYMu8qaumX0qJV7Qjpd09tPqOApo
         vkncWKNJrJ98CbS4TT1oufq6nxbBwzIbTjr8F3+XT4hiMs4BdY2yUkWnj4Kl3k7kkPkc
         dQxFBif5L30q7f+GFTc7BueqUmGvso62ijkiFK+AIT1lhnJPnS/L81HRF4Wgyn60jV7h
         0nhiuuFEemoyntVZ8PSyMXtDZ925GMPe00jhnz5jHkgrluim0bi4SKl3Inae9TODP1Ft
         SyiMEHOCocXN+OrrnnoilSTgQYROuwXIOuX5RZus/axQF1bkZJBIva0sGVPijrjk4mZI
         8luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297441; x=1747902241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HRRvwQZR7OY0o40CF4iX42SSRrEHUJjKFBagu/MDOQ=;
        b=JuCc8zbCR8gVoZaWwQsrSsGYEnK9DYy/vh0gBuoi1q2Wdxrz3JBE87Qb2m5sCVnt4A
         bZxIJrumnad0Ven0YEVu8KcZQj2RWHC5jhQLMDFFoYhjzxZHae/OACmiyKuVSdkLZSqI
         ijOLiIG0gAHopyqUXHgysRFWokHlRlgS0MIH2CFCLwUFd0f/X3CtJ8cYu6zY4qRgfEY4
         d88zeQNdlhhU3ZOtE9anvarWANmzbIdCUaInjgCu8K7eCaBELCCe658gdtE0FdtcZiPB
         Xculuc0tT+ckXPfxnf1ofoe0dzc8KIwTT+QRnk3FlIjA+5U/znt34UkHw8A/zHxDD/Gw
         WKNA==
X-Forwarded-Encrypted: i=1; AJvYcCVu9qx0tcYYMIQFQ+xHWQSO0OvdPEtQfaJRrkM9ZkEyzXN2Y6/3sBzlLrlXW4s7LJ8wJE0puNRk+Gw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJqLFB6nyfosQgII1C4GEawoLatSrvwOlaYUtHbYdzW7DUB2UL
	CVlZHHdhPOxG+/uFGzCh9O4ClK+neIdIQeIT10O/A3DFR89uXKPhUxiaF5H+3z0=
X-Gm-Gg: ASbGncv2vSjeJ/wykbjdlDf00lwPNYH2LKvMi4E+W1ibZSzYNToYJYM1CHVWfjlaXWu
	0Q56CmpkQfqqYagzmljlFEx/xr+UzVPJgFx+7kGaFdJkpoRGKww2+/KlR/y9QeK4mQ1Ap6i12WU
	zo/1JYyDX5W3dmqwkSgtE0ICVnXjmmBrEyfUo93MS+QQUZlljnsv2NmbvyM6G+k/1Fa1eTpaov3
	IrDrQlrZ99WUax0FSzaJzSFTXE7wx6aa5U4aAXIJsF7p0rPPxc1E5KmkVQfDtbEX94h8D8JdRsc
	55rbBzlVC/n1UyBQP1PWSIw2UpWGy8YclCOocsYoVQnslCXziOAadahPTLS7bw==
X-Google-Smtp-Source: AGHT+IEl4xkkhRV/6rqGgqq8GhxlIIH1Zsk+aKdZ8qLIk9sfmfbfHiVPZ4lcOrwQMJaY11G/EM+wbA==
X-Received: by 2002:a05:600c:3f0f:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-442f9714e8amr13194375e9.33.1747297440668;
        Thu, 15 May 2025 01:24:00 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:59 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v7 14/14] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Thu, 15 May 2025 10:22:15 +0200
Message-ID: <20250515082217.433227-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012402_482858_144870B8 
X-CRM114-Status: GOOD (  11.96  )
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

U0JJX0ZXRlRfTUlTQUxJR05FRF9ERUxFRyBuZWVkcyBoZWRlbGVnIHRvIGJlIG1vZGlmaWVkIHRv
IGRlbGVnYXRlCm1pc2FsaWduZWQgbG9hZC9zdG9yZSBleGNlcHRpb25zLiBTYXZlIGFuZCByZXN0
b3JlIGl0IGR1cmluZyBDUFUKbG9hZC9wdXQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVn
QHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jIHwgNDEgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKaW5kZXggYjBmNjZjN2JmMDEwLi42NzcwYzA0M2Ji
Y2IgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYworKysgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKQEAgLTE0LDYgKzE0LDggQEAKICNpbmNsdWRlIDxh
c20va3ZtX3ZjcHVfc2JpLmg+CiAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaV9md2Z0Lmg+CiAK
KyNkZWZpbmUgTUlTX0RFTEVHIChCSVRfVUxMKEVYQ19MT0FEX01JU0FMSUdORUQpIHwgQklUX1VM
TChFWENfU1RPUkVfTUlTQUxJR05FRCkpCisKIHN0cnVjdCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSB7
CiAJLyoqCiAJICogQGlkOiBGZWF0dXJlIElECkBAIC02OCw3ICs3MCw0NiBAQCBzdGF0aWMgYm9v
bCBrdm1fZndmdF9pc19kZWZpbmVkX2ZlYXR1cmUoZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgZmVh
dHVyZSkKIAlyZXR1cm4gZmFsc2U7CiB9CiAKK3N0YXRpYyBib29sIGt2bV9zYmlfZndmdF9taXNh
bGlnbmVkX2RlbGVnYXRpb25fc3VwcG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwly
ZXR1cm4gbWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUoKTsKK30KKworc3RhdGljIGxvbmcg
a3ZtX3NiaV9md2Z0X3NldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAorCQkJCQlzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKKwkJCQkJdW5zaWdu
ZWQgbG9uZyB2YWx1ZSkKK3sKKwlzdHJ1Y3Qga3ZtX3ZjcHVfY29uZmlnICpjZmcgPSAmdmNwdS0+
YXJjaC5jZmc7CisKKwlpZiAodmFsdWUgPT0gMSkgeworCQljZmctPmhlZGVsZWcgfD0gTUlTX0RF
TEVHOworCQljc3Jfc2V0KENTUl9IRURFTEVHLCBNSVNfREVMRUcpOworCX0gZWxzZSBpZiAodmFs
dWUgPT0gMCkgeworCQljZmctPmhlZGVsZWcgJj0gfk1JU19ERUxFRzsKKwkJY3NyX2NsZWFyKENT
Ul9IRURFTEVHLCBNSVNfREVMRUcpOworCX0gZWxzZSB7CisJCXJldHVybiBTQklfRVJSX0lOVkFM
SURfUEFSQU07CisJfQorCisJcmV0dXJuIFNCSV9TVUNDRVNTOworfQorCitzdGF0aWMgbG9uZyBr
dm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCisJCQkJCXN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAorCQkJCQl1bnNpZ25l
ZCBsb25nICp2YWx1ZSkKK3sKKwkqdmFsdWUgPSAoY3NyX3JlYWQoQ1NSX0hFREVMRUcpICYgTUlT
X0RFTEVHKSA9PSBNSVNfREVMRUc7CisKKwlyZXR1cm4gU0JJX1NVQ0NFU1M7Cit9CisKIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgZmVhdHVyZXNbXSA9IHsKKwl7CisJ
CS5pZCA9IFNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHLAorCQkuc3VwcG9ydGVkID0ga3Zt
X3NiaV9md2Z0X21pc2FsaWduZWRfZGVsZWdhdGlvbl9zdXBwb3J0ZWQsCisJCS5zZXQgPSBrdm1f
c2JpX2Z3ZnRfc2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKKwkJLmdldCA9IGt2bV9zYmlfZndm
dF9nZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAorCX0sCiB9OwogCiBzdGF0aWMgc3RydWN0IGt2
bV9zYmlfZndmdF9jb25maWcgKgotLSAKMi40OS4wCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
