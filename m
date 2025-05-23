Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E1FC54ED0
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmR6PFtVpqm533tHTxYqLIj1D4uzRruSvKeP5EMwhuQ=; b=M79vnijdg02q8W
	lWzOCRuUPrsDmTk1LnmQ9ljLG6GEjYum6dVUNeGYeut3PBrXD4tEtKkbCpLwkHvjbyTsbwwsxWHcT
	XTndqJhv3tNovJPbDs9I8RWtmOmI64KC4ptxcMJNSL/AejkSNTTgOudpUVCXd1SQhoknTy+NLOd4m
	HbTfPXylfYVY4s4wWotho373AVyC1wM5Ed4+usBJIowrDCVpIdrDf1KebnpZpJPPyuRIW+Cx9+Kso
	rk8dcS+KWzGyJ+BlIyNZX/FIBIIXDQ7zwgW9hdng/SIBeIvHEO2kEe5CsjG+dfHWKLabp8NWFjqDC
	E4COP0NDT5ShxfYGPsZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPWv-00000003ZS0-39JA;
	Fri, 23 May 2025 10:21:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPWt-00000003ZR3-2VAQ
	for kvm-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 10:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JOCKOWdc9Rm9mheK+/kf775/MsCKzvlzcdVw7vqLpnQ=; b=lV/dSMyWl8QlGIlKqVPjFhYltU
	EIoi0C4yllSCDHIZoT/iPpIyk21G2LFk7XMQ3Xa7WWQfw5hF5d/BebQJb/uiQbhPPRnC1JJmE8wDX
	+c1Gqn0iwuD3ujNoVvj6PJaPu2jnZ8EIpOzVlgnjwg2Ans0u7ZB/GbQP2LdOZVgTFEtue8RTQSb29
	4km7PW7O5vjEy7wMhfxqLnjxVi8olgaCT4JWkrzdN7C7CPJuugcjbDKUCYxtcNBia1QOckDt5PvmJ
	JV66wemq2tiXxghb2wTRNzWGnXmZr7AINUCmc0D4WED+MzBkXCLAw0cM3abfWGQ+2FrCzO+AdPM6S
	4USxKWrA==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIPWq-00000001Fus-3B2G
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:21:30 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-742c035f2afso4153428b3a.2
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 03:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995686; x=1748600486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOCKOWdc9Rm9mheK+/kf775/MsCKzvlzcdVw7vqLpnQ=;
        b=JbGWoevjectvEmF0QnOjZ2xiBNOTUo4NufslG+0B2paHhIdrVf+dc7X12nVopRX+8e
         pj2BuumS+T++mT91mp9pP1C5C+0IX8dRuvD4b44qSfuRotuQCY4I3llBHQh5Y1HnaCcV
         HjD99nXNm43wN9uyIr2fY9gmSnviXzCYcgAQro4jRsA9LLXq6oq9e0tCAKrB4alZ+gF6
         QP42LFH6oHIjuzol8MIoHgZSmFVkl4ehqhA7XvA0b+dWc4D6n8WF/p8O90os19G9OXmr
         VHUgwfDfAyxo3Qp61WjLBBtZ/NWbC6YKB3WQOCQL2laJKEZ4bFlWc+Z73SrTf4eQpS7n
         6Zvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995686; x=1748600486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOCKOWdc9Rm9mheK+/kf775/MsCKzvlzcdVw7vqLpnQ=;
        b=hPQKoqMz1724eXjKIsUqNZdroUQD3z/LB5lLWt607kpBYNA11vi5Cqk2DD39vM8zai
         lwIXruaxYHNDD8E+h8P5vsNACGzh1sm60OuWDzMubQKLC2ugEMgI/HDjmEga6cgBiKLI
         SZBUUAGfaizuV5HvKnPovD4uvBn3YnNwUqlnAKgA9NNp0c7OHxA/ttEaw8uHXDsBvF2h
         ecNAoec1OsbaxEeDo8AwyBJAWmMA+ulSF10qb18JHwGpF6iAJ0biOZq72nUgSB0fD/sh
         cYKmFLW+yPQLKLcT8vzCx+UZ0b2nvHf2NpJy45UlzE6se37jjOO/PneHYeJwnsyC6+FV
         bHfA==
X-Forwarded-Encrypted: i=1; AJvYcCX2XDyYjmAquoJuYE8It+Fo6IoCHn2KZ91ogtQABA5fPwkRsajxtDN8+PTG2S0fHyFcU6QAdnhfLrA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzK7uVME0ZWFDCizWn1XOrqcHQrMCPY08SFdC09cpfhxVxsynRS
	9MwAvuG040SFh7xG3owuSqX7MNjP2hDFExEe68tMWbkJZYt0MKRRfBWFWW+K4P1dUaw=
X-Gm-Gg: ASbGncukQuT5c/3pmcBvKx5b2xSme/PRV3trCp5/Uo3LmE+//L2ISKv1XmBh/oITHJz
	uSX/4iS0Z0RXH+7oy3z7Pw5CVQbycxia+w+Zu06UPzv/7kddCwj6UyRq281s9y98tGR6+zGRaCz
	9NXnnonAonZcWJUljg4+tkqnoGXXwx5QRcWt7W4r9TeysIO4o2r3xkaf1PKAM11XaAG/7UosIxo
	ZWl4Wrwcb4rOkJ0Ed51owzq6rLqdN63Pob0+TA8kry838PnfB6aqJK0r0IvQlL+hszpWnSs1r67
	CCdc81aotjWBcKLKZd7OofcpqTu/X6MhlYKZTRChpFLc/AE5/gFQ6uV6jfBRAKU=
X-Google-Smtp-Source: AGHT+IHNfzHp2c4l+fFLy0Ork8ZH3OaE1w7FL08Zf1prOjyoxcu7ttu2ohtJhdZMuyb/aYjEahxS1Q==
X-Received: by 2002:a05:6a00:1788:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-742a97eb5b9mr40841129b3a.14.1747995686279;
        Fri, 23 May 2025 03:21:26 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:25 -0700 (PDT)
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
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 04/14] riscv: sbi: add FWFT extension interface
Date: Fri, 23 May 2025 12:19:21 +0200
Message-ID: <20250523101932.1594077-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_112129_079660_83C1A1F4 
X-CRM114-Status: GOOD (  12.86  )
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
bWVudmNmZyBBRFVFIGJpdCwgU3NkYmx0cnAKRFRFLCBldGMpLiBBZGQgYW4gaW50ZXJmYWNlIHRv
IHNldCBsb2NhbCBmZWF0dXJlcyBmb3IgYSBzcGVjaWZpYyBjcHUKbWFzayBhcyB3ZWxsIGFzIGZv
ciB0aGUgb25saW5lIGNwdSBtYXNrLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxj
bGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAxNyArKysrKysrKysrKwog
YXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICB8IDU3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmgKaW5kZXggMDkzOGYyYThkMDFiLi4zNDFlNzQyMzhhYTAgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9z
YmkuaApAQCAtNTAzLDYgKzUwMywyMyBAQCBpbnQgc2JpX3JlbW90ZV9oZmVuY2VfdnZtYV9hc2lk
KGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFzaywKIAkJCQl1bnNpZ25lZCBsb25nIGFzaWQp
OwogbG9uZyBzYmlfcHJvYmVfZXh0ZW5zaW9uKGludCBleHQpOwogCitpbnQgc2JpX2Z3ZnRfc2V0
KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZsYWdzKTsK
K2ludCBzYmlfZndmdF9zZXRfY3B1bWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIHUzMiBmZWF0
dXJlLAorCQkJIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpOworLyoq
CisgKiBzYmlfZndmdF9zZXRfb25saW5lX2NwdXMoKSAtIFNldCBhIGZlYXR1cmUgb24gYWxsIG9u
bGluZSBjcHVzCisgKiBAZmVhdHVyZTogVGhlIGZlYXR1cmUgdG8gYmUgc2V0CisgKiBAdmFsdWU6
IFRoZSBmZWF0dXJlIHZhbHVlIHRvIGJlIHNldAorICogQGZsYWdzOiBGV0ZUIGZlYXR1cmUgc2V0
IGZsYWdzCisgKgorICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIGFwcHJvcHJpYXRlIGxpbnV4IGVy
cm9yIGNvZGUgb3RoZXJ3aXNlLgorICovCitzdGF0aWMgaW5saW5lIGludCBzYmlfZndmdF9zZXRf
b25saW5lX2NwdXModTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgdmFsdWUsCisJCQkJCSAgIHVu
c2lnbmVkIGxvbmcgZmxhZ3MpCit7CisJcmV0dXJuIHNiaV9md2Z0X3NldF9jcHVtYXNrKGNwdV9v
bmxpbmVfbWFzaywgZmVhdHVyZSwgdmFsdWUsIGZsYWdzKTsKK30KKwogLyogQ2hlY2sgaWYgY3Vy
cmVudCBTQkkgc3BlY2lmaWNhdGlvbiB2ZXJzaW9uIGlzIDAuMSBvciBub3QgKi8KIHN0YXRpYyBp
bmxpbmUgaW50IHNiaV9zcGVjX2lzXzBfMSh2b2lkKQogewpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCAxZDQ0YzM1MzA1
YTkuLjgxOGVmYWZkYzhlOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKQEAgLTI5OSw2ICsyOTksNjMgQEAgc3RhdGljIGlu
dCBfX3NiaV9yZmVuY2VfdjAyKGludCBmaWQsIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFz
aywKIAlyZXR1cm4gMDsKIH0KIAorc3RydWN0IGZ3ZnRfc2V0X3JlcSB7CisJdTMyIGZlYXR1cmU7
CisJdW5zaWduZWQgbG9uZyB2YWx1ZTsKKwl1bnNpZ25lZCBsb25nIGZsYWdzOworCWF0b21pY190
IGVycm9yOworfTsKKworc3RhdGljIHZvaWQgY3B1X3NiaV9md2Z0X3NldCh2b2lkICphcmcpCit7
CisJc3RydWN0IGZ3ZnRfc2V0X3JlcSAqcmVxID0gYXJnOworCWludCByZXQ7CisKKwlyZXQgPSBz
YmlfZndmdF9zZXQocmVxLT5mZWF0dXJlLCByZXEtPnZhbHVlLCByZXEtPmZsYWdzKTsKKwlpZiAo
cmV0KQorCQlhdG9taWNfc2V0KCZyZXEtPmVycm9yLCByZXQpOworfQorCisvKioKKyAqIHNiaV9m
d2Z0X3NldCgpIC0gU2V0IGEgZmVhdHVyZSBvbiB0aGUgbG9jYWwgaGFydAorICogQGZlYXR1cmU6
IFRoZSBmZWF0dXJlIElEIHRvIGJlIHNldAorICogQHZhbHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0
byBiZSBzZXQKKyAqIEBmbGFnczogRldGVCBmZWF0dXJlIHNldCBmbGFncworICoKKyAqIFJldHVy
bjogMCBvbiBzdWNjZXNzLCBhcHByb3ByaWF0ZSBsaW51eCBlcnJvciBjb2RlIG90aGVyd2lzZS4K
KyAqLworaW50IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwg
dW5zaWduZWQgbG9uZyBmbGFncykKK3sKKwlyZXR1cm4gLUVPUE5PVFNVUFA7Cit9CisKKy8qKgor
ICogc2JpX2Z3ZnRfc2V0X2NwdW1hc2soKSAtIFNldCBhIGZlYXR1cmUgZm9yIHRoZSBzcGVjaWZp
ZWQgY3B1bWFzaworICogQG1hc2s6IENQVSBtYXNrIG9mIGNwdXMgdGhhdCBuZWVkIHRoZSBmZWF0
dXJlIHRvIGJlIHNldAorICogQGZlYXR1cmU6IFRoZSBmZWF0dXJlIElEIHRvIGJlIHNldAorICog
QHZhbHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0byBiZSBzZXQKKyAqIEBmbGFnczogRldGVCBmZWF0
dXJlIHNldCBmbGFncworICoKKyAqIFJldHVybjogMCBvbiBzdWNjZXNzLCBhcHByb3ByaWF0ZSBs
aW51eCBlcnJvciBjb2RlIG90aGVyd2lzZS4KKyAqLworaW50IHNiaV9md2Z0X3NldF9jcHVtYXNr
KGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgdTMyIGZlYXR1cmUsCisJCQkgICAgICAgdW5zaWduZWQg
bG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncykKK3sKKwlzdHJ1Y3QgZndmdF9zZXRfcmVx
IHJlcSA9IHsKKwkJLmZlYXR1cmUgPSBmZWF0dXJlLAorCQkudmFsdWUgPSB2YWx1ZSwKKwkJLmZs
YWdzID0gZmxhZ3MsCisJCS5lcnJvciA9IEFUT01JQ19JTklUKDApLAorCX07CisKKwlpZiAoZmVh
dHVyZSAmIFNCSV9GV0ZUX0dMT0JBTF9GRUFUVVJFX0JJVCkKKwkJcmV0dXJuIC1FSU5WQUw7CisK
Kwlvbl9lYWNoX2NwdV9tYXNrKG1hc2ssIGNwdV9zYmlfZndmdF9zZXQsICZyZXEsIDEpOworCisJ
cmV0dXJuIGF0b21pY19yZWFkKCZyZXEuZXJyb3IpOworfQorCiAvKioKICAqIHNiaV9zZXRfdGlt
ZXIoKSAtIFByb2dyYW0gdGhlIHRpbWVyIGZvciBuZXh0IHRpbWVyIGV2ZW50LgogICogQHN0aW1l
X3ZhbHVlOiBUaGUgdmFsdWUgYWZ0ZXIgd2hpY2ggbmV4dCB0aW1lciBldmVudCBzaG91bGQgZmly
ZS4KLS0gCjIuNDkuMAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
