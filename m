Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDD2C021A2
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYK09mzhAiIQ+lh/TZEDN4yhG3aH8lOXhm1a2seIXZQ=; b=2jQCpuo3qRSGq6
	zDoMbVUkW96zIjaAu3DCucju+6cWMt5HswgrSIBSEZv63XPZ+eaRjFIuURHz78xvjSD1uwjLjUh4e
	2BB0X34Ht37SeYzsd60ued0HGJjX8Wfvmq5RJVWqv1dUG2dgbIh9jucCDlFoso1blmetmn4u1Oovb
	FLIlU4r5KHHI09QPEhyWlD3CzezvrJ7+xlzKbRlNWa1v4lQ0CQqDrmNMm2wAqs7+QRNp1dlxC3Pb4
	foRJowkb/QOhvjuNa/MvNIXNy+ixDv17pxli37Su0c+PpggECom9d1veOzQMPnUf9a4AQDpSAnQJ+
	YCb/X9yxU1tVnTFIcM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbb0-00000001YNT-2euf;
	Mon, 10 Feb 2025 21:45:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbRr-00000001VNL-30bv
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436281c8a38so32206875e9.3
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223370; x=1739828170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqqX7ElFp9wIqiTogqx4ZkugO9mCs5sfeq9wlnFties=;
        b=C92dpNh3YKxBw+2lvVm69nMEZ27S+YrmYuaFmXg+E0UkcSRF8hMFyL/DltJ8GkJqc6
         1oy0WwLU425NC2k7Z5m8paKAw7RXn5S6IJc/Re3M5H6L1Y9Ohhwy6iXkT6SNWMh+VK1I
         vb+E/desjOe7w5R7iFIveunCxMWEsXryQYJn9oF/sCqLe8NRmm6nfjPjasPkpT9aReAx
         qcBxYHERNnQJrWmmj11aP1Oi6Eh/mc3735ghcvOs7eBUofrHGj/A/c4b3yTrZvkTYCS4
         pD4Qp8FQ8uR0nkVXtWztPqMj+x0CYiAXzHHnmheVhqJOMtDcg4qIf8G7y8z+zenM/TAE
         ZDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223370; x=1739828170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqqX7ElFp9wIqiTogqx4ZkugO9mCs5sfeq9wlnFties=;
        b=NOq99/BdkBD323aTJYC/3cqqVyg6lpQyJSegwk1dcmyBRyiS9hGzONUL/89AA9iWlP
         Mjg1/lPjaAGmQyXJC4W2vIyFAQLBqBixQDFt/53IYPBZWRhSx7SjkqXT5wPA9ZIO1rxc
         b7Hhk4L0m70bNrmmuflLFNMc7BokHTyKqqNTJCZKz8Dpw/y4Xmuo6U9dF7NWhapntZhf
         hRZWv70qTVWzdxDpV/N12NJ+fkCh6MSBH2swzAeoUiVsk9lArmzHc4b3ugA5ha9eg6zh
         Z9YqjJcDPwg/VE3gC2+zcsi6V/lDf3Pkc7Bz/QKnkTpbxH02CBmI2JdNlHkMX9JeFOUE
         DVfg==
X-Forwarded-Encrypted: i=1; AJvYcCXcU1fO02HOhFSsMduqxZ9uQfRp/tOiPuSRZd6PLQpeAlMoSwfUQvJHp1PeEawesh9z20PUlF+v0Kg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2L0sqrUeswNPr1OXs+uK9Xs2U0HRTz0x3d3ihMf3Af+3EeHbH
	cfoy82rrqMnF7x+SjPdLUIYZDKSC8GpQW+j+60gDs9qHkjLioks3aUwoKO0l7HE=
X-Gm-Gg: ASbGnct9BQ8eH4b08SUj1sGQEqiRHJk3w9h67yvs3/2sa81U/wXSFotx8Brw6KYXuvM
	7fGoynlCEjR7c85ixlPwEDdOZVNMW/aIxPaYBvCOD+VEJ/ArPyVD71G3gFa4yFGfWLtsGrkWoXi
	8nO+ATu23pPaexDk3U9nFrpfNy/WhIr8CzvcdjIYPiUXGVa37XzHPvgcad7oSHMz2JJFFuVy46f
	GLI/OGlh9vDJz5Surfafw/xfz06GTdDCruwMziBexo5tnkh9EWAHFBk/Pz+TBl5XmLl3VcvWesf
	G+9vmCdaB7I9Q5H6
X-Google-Smtp-Source: AGHT+IEI+PbDSd+iZWI542rdQ+gdbkP59WcT5edYepFvbp4hadsR2YRTr4AHJJDYEwdy2nUI6Xz3fQ==
X-Received: by 2002:a05:600c:8706:b0:439:350a:ab52 with SMTP id 5b1f17b1804b1-439350aacbemr92952605e9.30.1739223370401;
        Mon, 10 Feb 2025 13:36:10 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:09 -0800 (PST)
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
Subject: [PATCH v2 05/15] riscv: misaligned: move emulated access uniformity check in a function
Date: Mon, 10 Feb 2025 22:35:38 +0100
Message-ID: <20250210213549.1867704-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_133611_801099_B0EBB11C 
X-CRM114-Status: GOOD (  11.88  )
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

U3BsaXQgdGhlIGNvZGUgdGhhdCBjaGVjayBmb3IgdGhlIHVuaWZvcm1pdHkgb2YgbWlzYWxpZ25l
ZCBhY2Nlc3NlcwpwZXJmb3JtYW5jZSBvbiBhbGwgY3B1cyBmcm9tIGNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKQp0byBpdHMgb3duIGZ1bmN0aW9uIHdoaWNoIHdpbGwg
YmUgdXNlZCBmb3IgZGVsZWdhdGlvbiBjaGVjay4gTm8KZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVu
ZGVkLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29t
PgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDE4ICsrKysrKysr
KysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCmluZGV4IDU3ZGVkN2U3NGRkOC4u
N2Q2MTg1ZGVlYTMzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGln
bmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCkBAIC02NzMs
MTAgKzY3MywyMCBAQCBzdGF0aWMgaW50IGNwdV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
c19lbXVsYXRlZCh1bnNpZ25lZCBpbnQgY3B1KQogCXJldHVybiAwOwogfQogCi1ib29sIGNoZWNr
X3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKK3N0YXRpYyBib29sIGFs
bF9jcHVzX3VuYWxpZ25lZF9zY2FsYXJfYWNjZXNzX2VtdWxhdGVkKHZvaWQpCiB7CiAJaW50IGNw
dTsKIAorCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQorCQlpZiAocGVyX2NwdShtaXNhbGlnbmVk
X2FjY2Vzc19zcGVlZCwgY3B1KSAhPQorCQkgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1ND
QUxBUl9FTVVMQVRFRCkKKwkJCXJldHVybiBmYWxzZTsKKworCXJldHVybiB0cnVlOworfQorCiti
b29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKK3sKIAkv
KgogCSAqIFdlIGNhbiBvbmx5IHN1cHBvcnQgUFJfVU5BTElHTiBjb250cm9scyBpZiBhbGwgQ1BV
cyBoYXZlIG1pc2FsaWduZWQKIAkgKiBhY2Nlc3NlcyBlbXVsYXRlZCBzaW5jZSB0YXNrcyByZXF1
ZXN0aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQpAQCAtNjg0LDEwICs2OTQsOCBAQCBi
b29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAkgKi8K
IAlvbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkLCBOVUxMLCAxKTsK
IAotCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQotCQlpZiAocGVyX2NwdShtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCwgY3B1KQotCQkgICAgIT0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NDQUxB
Ul9FTVVMQVRFRCkKLQkJCXJldHVybiBmYWxzZTsKKwlpZiAoIWFsbF9jcHVzX3VuYWxpZ25lZF9z
Y2FsYXJfYWNjZXNzX2VtdWxhdGVkKCkpCisJCXJldHVybiBmYWxzZTsKIAogCXVuYWxpZ25lZF9j
dGwgPSB0cnVlOwogCXJldHVybiB0cnVlOwotLSAKMi40Ny4yCgoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
