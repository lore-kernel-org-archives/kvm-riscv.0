Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845E2C282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1b6yDq5A6dWzZcdPORKZNW88Z6OWz8rMdBRHZSZJJpw=; b=XUyoHmAwxIRp3F
	Zx1Fsa4+OoU/0n6EsxD+1G02wjaLacLOTdcPXAOB1a10gNK2glYj4ejzXfOU20ZYalUE4HAhHo5lj
	Q9nzkDOe914HJ/A/Zi4AuW/dTrztS0F4Hk95mcIhRrPFh+o+ZUodtzpZF8h/aZ28uUDqDiZM7dyzN
	lMj66BBQhj39Dh+U6oN+oQpGVdLhcD1zR0plbRL9dZdd/tfg7kzWZVmlnWesFBqNeMGKI5lLJc6zJ
	1iRXU/8XMpKsykYnOymZBby/QHHkPtVF+f4gNYUMjkX516AcGn2XjxNE/t+hRflmYCDlHz/ywHikJ
	yhzuFI67lrxkGPm6PT3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLq-00000003Fse-15xw;
	Mon, 10 Mar 2025 15:47:34 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treoS-000000037RW-1mEi
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:13:05 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso7661266a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619583; x=1742224383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AL3KrdqQvlwv1xQYem17t7QUv6GmMan/yx9/ashDvsw=;
        b=UteZiBC0+idb3DP8Mg/PQVTFFHKHuoxWHTPMJgRlbzdpFJ8EaUebbl+mXoiaLk1564
         Hv0pin9Jz5ghPvn5JYiqY9kBKBDoDfXPa58CM0/57FRvN4BlSNOMOlZ2MlqB6S9U3Oqh
         EReJCDQK6x/NMEimiTdV+gUVDkoICG1Oy9ymvFdtxMjuz/gHdjiWtBbxknMzFCq0/Elz
         J5U2XiGQeRROf4MGR6wwwpSnEnnuiLR8Us8i2QM+WTgb+wUIwVi6TyA88IkSQw8H2t8G
         CdMKpAaxBg5865xDFdHWunLyU+jTQ6N9fmBgqCGDFH7E6C+unrn2/tXiMW0lnCeD1X+O
         3JuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619583; x=1742224383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AL3KrdqQvlwv1xQYem17t7QUv6GmMan/yx9/ashDvsw=;
        b=veu0c8x4V7aeDv87K/4dSX/NgVghVegxeGui95jn2QARgV6ScQWNda5kR1OXgdPo94
         3RvHJNZJqARJOGr8omYTgp2BJRPSEjAkvl2TXt475rF4H5tjDbLaZ+iUicuSy22fnvKu
         jl+sJICYrGI4qrBkUL4yUFe80NwhL7GlJJefJKdfydMUNDdfC0tzF6j0RHI5INgtSjPz
         FP1Cb+dcDT/ogWO4yNhPY4Es/cOfB+2d3WhsJTzUU5actnXY/m/ct3r+ATViH0SmTlQt
         IpZA7LMvY77OP6J0F4T2B7CWQ++m8fbtfgMhUqlZKRD/vvS2vcB6ihTK4FcqP5VVd5hE
         06kA==
X-Forwarded-Encrypted: i=1; AJvYcCUuRUZbyFp27N3FwzseZUDkRMQvLdAzz1NMmv8dqDQL3FXb8IuYsUa61wWjrXC/j4MBfa4jdGQpnpg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOoyedc8hvf+aiNu7hk6lGfdTcCjNpGyDLysISzmao9/irGdZY
	MBcnMD4hmhq+1z/amUsDETlq738eNIR6ubZgZdw5LtJ8IbOOC9UroH0n+YzCd3M=
X-Gm-Gg: ASbGncsX/lJ+Z4BRKzCnkaoPWNKd/JYlI3WXjd+2Giv6/eoMAG3VKeqNUxhTvZBNhFE
	tu+dhCiM9sa8ImhRvqc1kq3ltc3nmmedW5lIi13FXaX+VlKJ8RiysS+R39Bp6AD6XELPPtaRjVx
	FoDcQN3EmoPYTPJsQ0BdeM8QW/AFbL2V4qXzO6PN0Hij2a2R3nMtrvaf8BzERUADCSP6WL4x2Oj
	W7mB7UR2Ma2PBk1rLe/5PDakYS9eYjarp0c6u9RjFfxkPQjL2dJphzGAxpCACCnNS5yOeKvx0os
	FgBLKGzDAKsStlOL501fMix3hnUV4G/WHV/UpWpsy1kDRF4RCppLHKA5
X-Google-Smtp-Source: AGHT+IFqOyaVREaO+MohFgN6MHhlVeTDEW+52HPkp4Dqon7PwKBjXGmUdU6fJQIinAVq3owNZZQiOQ==
X-Received: by 2002:a17:90b:3810:b0:2fa:3b6b:3370 with SMTP id 98e67ed59e1d1-2ffbc1f57cemr15412229a91.16.1741619583563;
        Mon, 10 Mar 2025 08:13:03 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:03 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 02/17] riscv: sbi: add FWFT extension interface
Date: Mon, 10 Mar 2025 16:12:09 +0100
Message-ID: <20250310151229.2365992-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081304_474829_22F8EB1D 
X-CRM114-Status: GOOD (  15.46  )
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

VGhpcyBTQkkgZXh0ZW5zaW9ucyBlbmFibGVzIHN1cGVydmlzb3IgbW9kZSB0byBjb250cm9sIGZl
YXR1cmUgdGhhdCBhcmUKdW5kZXIgTS1tb2RlIGNvbnRyb2wgKEZvciBpbnN0YW5jZSwgU3ZhZHUg
bWVudmNmZyBBRFVFIGJpdCwgU3NkYmx0cnAKRFRFLCBldGMpLgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc2JpLmggfCAgNSArKwogYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICB8IDk3ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IGJiMDc3ZDBjOTEyZi4uZmM4N2M2
MDljMTFhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKQEAgLTUwMyw2ICs1MDMsMTEgQEAgaW50IHNiaV9y
ZW1vdGVfaGZlbmNlX3Z2bWFfYXNpZChjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCiAJ
CQkJdW5zaWduZWQgbG9uZyBhc2lkKTsKIGxvbmcgc2JpX3Byb2JlX2V4dGVuc2lvbihpbnQgZXh0
KTsKIAoraW50IHNiaV9md2Z0X2FsbF9jcHVzX3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9u
ZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncywKKwkJCSAgYm9vbCByZXZlcnRfb25fZmFpbHVy
ZSk7CitpbnQgc2JpX2Z3ZnRfZ2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1ZSk7
CitpbnQgc2JpX2Z3ZnRfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNp
Z25lZCBsb25nIGZsYWdzKTsKKwogLyogQ2hlY2sgaWYgY3VycmVudCBTQkkgc3BlY2lmaWNhdGlv
biB2ZXJzaW9uIGlzIDAuMSBvciBub3QgKi8KIHN0YXRpYyBpbmxpbmUgaW50IHNiaV9zcGVjX2lz
XzBfMSh2b2lkKQogewpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCAxOTg5YjhjYWRlMWIuLjI1NjkxMGRiMTMwNyAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
c2JpLmMKQEAgLTI5OSw2ICsyOTksMTAzIEBAIHN0YXRpYyBpbnQgX19zYmlfcmZlbmNlX3YwMihp
bnQgZmlkLCBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCiAJcmV0dXJuIDA7CiB9CiAK
K2ludCBzYmlfZndmdF9nZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKQorewor
CXJldHVybiAtRU9QTk9UU1VQUDsKK30KKworLyoqCisgKiBzYmlfZndmdF9zZXQoKSAtIFNldCBh
IGZlYXR1cmUgb24gYWxsIG9ubGluZSBjcHVzCisgKiBAZmVhdHVyZTogVGhlIGZlYXR1cmUgdG8g
YmUgc2V0CisgKiBAdmFsdWU6IFRoZSBmZWF0dXJlIHZhbHVlIHRvIGJlIHNldAorICogQGZsYWdz
OiBGV0ZUIGZlYXR1cmUgc2V0IGZsYWdzCisgKgorICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIGFw
cHJvcHJpYXRlIGxpbnV4IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgorICovCitpbnQgc2JpX2Z3ZnRf
c2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZsYWdz
KQoreworCXJldHVybiAtRU9QTk9UU1VQUDsKK30KKworc3RydWN0IGZ3ZnRfc2V0X3JlcSB7CisJ
dTMyIGZlYXR1cmU7CisJdW5zaWduZWQgbG9uZyB2YWx1ZTsKKwl1bnNpZ25lZCBsb25nIGZsYWdz
OworCWNwdW1hc2tfdCBtYXNrOworfTsKKworc3RhdGljIHZvaWQgY3B1X3NiaV9md2Z0X3NldCh2
b2lkICphcmcpCit7CisJc3RydWN0IGZ3ZnRfc2V0X3JlcSAqcmVxID0gYXJnOworCisJaWYgKHNi
aV9md2Z0X3NldChyZXEtPmZlYXR1cmUsIHJlcS0+dmFsdWUsIHJlcS0+ZmxhZ3MpKQorCQljcHVt
YXNrX2NsZWFyX2NwdShzbXBfcHJvY2Vzc29yX2lkKCksICZyZXEtPm1hc2spOworfQorCitzdGF0
aWMgaW50IHNiaV9md2Z0X2ZlYXR1cmVfbG9jYWxfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBs
b25nIHZhbHVlLAorCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsCisJCQkJICAgICAgYm9v
bCByZXZlcnRfb25fZmFpbCkKK3sKKwlpbnQgcmV0OworCXVuc2lnbmVkIGxvbmcgcHJldl92YWx1
ZTsKKwljcHVtYXNrX3QgdG1wOworCXN0cnVjdCBmd2Z0X3NldF9yZXEgcmVxID0geworCQkuZmVh
dHVyZSA9IGZlYXR1cmUsCisJCS52YWx1ZSA9IHZhbHVlLAorCQkuZmxhZ3MgPSBmbGFncywKKwl9
OworCisJY3B1bWFza19jb3B5KCZyZXEubWFzaywgY3B1X29ubGluZV9tYXNrKTsKKworCS8qIFdl
IGNhbiBub3QgcmV2ZXJ0IGlmIGZlYXR1cmVzIGFyZSBsb2NrZWQgKi8KKwlpZiAocmV2ZXJ0X29u
X2ZhaWwgJiYgZmxhZ3MgJiBTQklfRldGVF9TRVRfRkxBR19MT0NLKQorCQlyZXR1cm4gLUVJTlZB
TDsKKworCS8qIFJlc2V0IHZhbHVlIGlzIHRoZSBzYW1lIGZvciBhbGwgY3B1cywgcmVhZCBpdCBv
bmNlLiAqLworCXJldCA9IHNiaV9md2Z0X2dldChmZWF0dXJlLCAmcHJldl92YWx1ZSk7CisJaWYg
KHJldCkKKwkJcmV0dXJuIHJldDsKKworCS8qIEZlYXR1cmUgbWlnaHQgYWxyZWFkeSBiZSBzZXQg
dG8gdGhlIHZhbHVlIHdlIHdhbnQgKi8KKwlpZiAocHJldl92YWx1ZSA9PSB2YWx1ZSkKKwkJcmV0
dXJuIDA7CisKKwlvbl9lYWNoX2NwdV9tYXNrKCZyZXEubWFzaywgY3B1X3NiaV9md2Z0X3NldCwg
JnJlcSwgMSk7CisJaWYgKGNwdW1hc2tfZXF1YWwoJnJlcS5tYXNrLCBjcHVfb25saW5lX21hc2sp
KQorCQlyZXR1cm4gMDsKKworCXByX2VycigiRmFpbGVkIHRvIHNldCBmZWF0dXJlICV4IGZvciBh
bGwgb25saW5lIGNwdXMsIHJldmVydGluZ1xuIiwKKwkgICAgICAgZmVhdHVyZSk7CisKKwlyZXEu
dmFsdWUgPSBwcmV2X3ZhbHVlOworCWNwdW1hc2tfY29weSgmdG1wLCAmcmVxLm1hc2spOworCW9u
X2VhY2hfY3B1X21hc2soJnJlcS5tYXNrLCBjcHVfc2JpX2Z3ZnRfc2V0LCAmcmVxLCAxKTsKKwlp
ZiAoY3B1bWFza19lcXVhbCgmcmVxLm1hc2ssICZ0bXApKQorCQlyZXR1cm4gMDsKKworCXJldHVy
biAtRUlOVkFMOworfQorCisvKioKKyAqIHNiaV9md2Z0X2FsbF9jcHVzX3NldCgpIC0gU2V0IGEg
ZmVhdHVyZSBvbiBhbGwgb25saW5lIGNwdXMKKyAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSB0byBi
ZSBzZXQKKyAqIEB2YWx1ZTogVGhlIGZlYXR1cmUgdmFsdWUgdG8gYmUgc2V0CisgKiBAZmxhZ3M6
IEZXRlQgZmVhdHVyZSBzZXQgZmxhZ3MKKyAqIEByZXZlcnRfb25fZmFpbDogdHJ1ZSBpZiBmZWF0
dXJlIHZhbHVlIHNob3VsZCBiZSByZXN0b3JlZCB0byBpdCdzIG9yaWduYWwKKyAqIAkJICAgIHZh
bHVlIG9uIGZhaWx1cmUuCisgKgorICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIGFwcHJvcHJpYXRl
IGxpbnV4IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgorICovCitpbnQgc2JpX2Z3ZnRfYWxsX2NwdXNf
c2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZsYWdz
LAorCQkJICBib29sIHJldmVydF9vbl9mYWlsKQoreworCWlmIChmZWF0dXJlICYgU0JJX0ZXRlRf
R0xPQkFMX0ZFQVRVUkVfQklUKQorCQlyZXR1cm4gc2JpX2Z3ZnRfc2V0KGZlYXR1cmUsIHZhbHVl
LCBmbGFncyk7CisKKwlyZXR1cm4gc2JpX2Z3ZnRfZmVhdHVyZV9sb2NhbF9zZXQoZmVhdHVyZSwg
dmFsdWUsIGZsYWdzLAorCQkJCQkgIHJldmVydF9vbl9mYWlsKTsKK30KKwogLyoqCiAgKiBzYmlf
c2V0X3RpbWVyKCkgLSBQcm9ncmFtIHRoZSB0aW1lciBmb3IgbmV4dCB0aW1lciBldmVudC4KICAq
IEBzdGltZV92YWx1ZTogVGhlIHZhbHVlIGFmdGVyIHdoaWNoIG5leHQgdGltZXIgZXZlbnQgc2hv
dWxkIGZpcmUuCi0tIAoyLjQ3LjIKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
