Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63CDC54755
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1lEWVeMDJ/7GVBZatQwGv6VlvKn5NwYsktOvalsaEY=; b=VYINHhZQrYH7/r
	p5VyWNiFCUIu/6kcUViXPQUNYPatWJOt/00g02IMzJFDUCDlaDCRHRV0AJ7cqVZ9RSyUUJnPdD1Zy
	zSZw5vuZJ2AtiOacsfZ6JwsizG4lxrJd8H2xaWpO6e2tfG82/zX75hlPUm9V+JwopoG/4qFJabNab
	hTAtQnuqBoyq4gEH47s31hzVMgqZ6ObcA6ki5MShbzl5fHpiB1wpTLwEvGdVlh5eIhUApCxlVrDsV
	BZd5HxIXtbXqjuN5BrsU68hmKXYHdupZ11ApMvduMHlgdeDzqjq/PUxLHsCjkB/5W4ny5jwRuSYWd
	OJj+UkEPXpFzT0RPuKCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyH-0000000HXqN-2dVF;
	Thu, 15 May 2025 08:29:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsg-0000000HVkw-3RKV
	for kvm-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso5861105e9.1
        for <kvm-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297433; x=1747902233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rW3Gt5ot6i3Z0vibD5tiRCC8lZra7MrDIFxKpe4L2VI=;
        b=oTtdKQZQ0cRtc2kwQScLzxnM/O++XT/u5hw/im4Gx3pWz0RkyCqKhMBIaV9tjH6YiV
         GHnbaRnyp4M7SJF8AbT/1UT/L9W8ARR1s66+cYEPIjG43mCS60z4IcyWewzZWY9AqKU4
         m+FmFSvBOyVm57viSidwxVbJaZg8jB4BbRW1/qIkD9XVb2IYA+jvOklLUiDK036bazxE
         DGgKZJMHVcpSWsRty8GAm2dfKeddOxpevNUDHMdeOPbTN1igf2XfEo2XgUhhLExcZ3NO
         1UiyV/Evs2GJk84CCCOw7GHj0yZn5eVBRFR3l2HT2veMO0cDnqGgQqci0R59IZbdXaZF
         h1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297433; x=1747902233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rW3Gt5ot6i3Z0vibD5tiRCC8lZra7MrDIFxKpe4L2VI=;
        b=iIIfcA/pjRTgcL75I1onjxgr+3U3KPRKv3tfA5VsA7E5K9dbZlzjhAftDrfR/VzTQi
         OyT+IgKglt2ollx2SVw795BEfOr04fjEE6B3X3tuo93wA/JeMyQ50vpZF00xfKiVe0YP
         IO8zxdSittbXmrwvgpJ31typNfm4fydxe/TwGnfNxhvvxgtnuMVGgWANelWQV/ig9adu
         EDaF4gTGYgGHlS6FfQshROwWRgrAX97UlEiChQtcRRXQL5YSiPXodK9vzA3QAHUNWqBR
         /TcYUQQKSgAAx+2xjh+fQlJvIS9oy7z2SHkUpDWTVAHJcIrVpFe5V0Mk5JFnGz0+zBuD
         mQoA==
X-Forwarded-Encrypted: i=1; AJvYcCV3GQybQl+YBlfKBHKms6QzelnwtFipEoV9tQ4PXKbNC5VdupHotrIgn0ZlgcZaIgVL92p8PdYaoVo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmQvZMNkZVIj8NZAD76t4YKzdoadfiSdVyozNXTv1HXaBl67A5
	0yyF9EOri1QOULE7NBzoK0T1piWZ/MP1dOlFDh6TglSJ34vciRxe+ElS3z3DkKA=
X-Gm-Gg: ASbGncuTstP7ZM/CmWWaf4FWPOs/SWnx/veRoBJn5eqBzSutR/oEwTPFBXKxe2pSz7W
	YK5CnCH4nVB/MOhRkU8YKIueidBLEG0tYJDYlBI8lnIsx3aK3Nq2egqKg+jzlLAinmXGIJIR4p8
	IaN/rM6fAEndd4ehd0C71Yyxo07N5kWIxiUmAszLdYFm4DjBY0ubK1h3YmylES7sH6lBj64e+81
	nZQ925RIuOVCnny1yzhUBteI6dFLj9p/4nkerSCZPara0PGlDJ3j/bq4VcoREjDTD55d4PzLdRW
	aiXRBTNNFW4ErLzOg7Ts0Zjq7DC4kDjwtERkgSMgup7kHTEeElc=
X-Google-Smtp-Source: AGHT+IEkMTLzUmbcaQoV7fBGhKB8oDf174vYHHp/il10qE0/kSBDkuCpwfLuKVtfldQPVM2OqN3Neg==
X-Received: by 2002:a05:600c:a07:b0:43c:e481:3353 with SMTP id 5b1f17b1804b1-442f96eca92mr14271065e9.17.1747297433494;
        Thu, 15 May 2025 01:23:53 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:52 -0700 (PDT)
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
Subject: [PATCH v7 08/14] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Thu, 15 May 2025 10:22:09 +0200
Message-ID: <20250515082217.433227-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012354_853512_A8248F1E 
X-CRM114-Status: GOOD (  10.24  )
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

bWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgaXMgZGVmaW5lZCB1bmRlciBDT05GSUdfUklTQ1ZfU0NB
TEFSX01JU0FMSUdORUQKYnV0IHdhcyB1c2VkIHVuZGVyIENPTkZJR19SSVNDVl9QUk9CRV9VTkFM
SUdORURfQUNDRVNTLiBGaXggdGhhdCBieQp1c2luZyB0aGUgY29ycmVjdCBjb25maWcgb3B0aW9u
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBh
cmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNh
bGlnbmVkLmMKaW5kZXggMzRiNGE0ZTlkZmNhLi5lNTUxYmExN2Y1NTcgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTM2OSw3ICszNjksNyBAQCBzdGF0aWMgaW50IGhhbmRs
ZV9zY2FsYXJfbWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCiAJcGVyZl9z
d19ldmVudChQRVJGX0NPVU5UX1NXX0FMSUdOTUVOVF9GQVVMVFMsIDEsIHJlZ3MsIGFkZHIpOwog
Ci0jaWZkZWYgQ09ORklHX1JJU0NWX1BST0JFX1VOQUxJR05FRF9BQ0NFU1MKKyNpZmRlZiBDT05G
SUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQKIAkqdGhpc19jcHVfcHRyKCZtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFSX0VNVUxBVEVEOwog
I2VuZGlmCiAKLS0gCjIuNDkuMAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
