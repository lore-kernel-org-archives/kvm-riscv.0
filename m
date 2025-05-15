Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5F5C5475C
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Tsb3DZxAkpbAw/6+GhIufO7qDy8aMfeTeq7ihFxN6Q=; b=T6uheV9Nezt+yA
	cr+OvX2No29YfYtv6u95mybmbY+2HJ+/StR3NcrXPWybs58JslL4BcrWfodN/ohopqVP0lMIqNDT0
	k0OUt9oFKFY7A8EhjAuai9sHZkuPDbGsMFn+N5zAsJX596u8EpzY6/+N5XYiY0s59PVtoAHajiwY6
	s9Bwo/v9OxPxJdt+T61VRnMebXpzWvkZSxrambCZSeyUzlVdgluUZ5Uyje/wgCLqRKu9wpsTwhBWS
	r2/Dnpl35h0yT3iVriFjdzWqfI6QJ1UB1Rklul5dBd0N2apj16SpZRldJ8pMkO1u55m82+ubkJ3jw
	s01YdfK7NbVaUEqO3Ehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyI-0000000HXrG-0Ppt;
	Thu, 15 May 2025 08:29:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsi-0000000HVmR-0laE
	for kvm-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso4680665e9.3
        for <kvm-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297435; x=1747902235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJAkm6pLaRGxiRfDXZi/YHgW/rz4khqaVw2vC12MUOY=;
        b=qLBPyiHWeMY5RbggoMmfIZ+GhXd4CPI7pfLO7MLIij9oE1PkKe5Jsl34s6PSbOPeSx
         fn3QoOUe/Uzgax+6TybYEriIaVWRU1MmouK56+C2v7NMHcxTrY2Q5eJo3sHtn97gN1cI
         SI7f8KljCfFsdcANHz3ro8Smez/kso70iXjJu9OQAVS/wGCXheLigxcq6QdphCfHIQ4l
         2yEPs0Y72zofHdzsqnYEm+FXzJyIuEkiYGsUUItwVHf4H3KPHCSHzvp8djDCYZRmWgeD
         pMC0HH5ECvd1xKsZJfbhjx6F+7F6sqdS2dGPFs91joEMPiuk9Uyy1bG0QTK9jMQzPpYy
         bXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297435; x=1747902235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJAkm6pLaRGxiRfDXZi/YHgW/rz4khqaVw2vC12MUOY=;
        b=mZRJzJnDb9ad+lXHVqW++AtSY7i8PExZgRKASxzYhdYIFOqHV75YYc2MtXNgxgDBiN
         wqpFVpPtBUX7IJWQc454wegLq1IBWcu3gdwUsiQja1WqxAKnNq8ijkWg2uToSXVvH8mv
         ueSlqP4hl+o6a8sJDuMS9aCmAEYMHqNZDlUzjxUz/ZYZhsLncEcvedejAy/riuc6XWC4
         jYo9S10Yhzh3wD2eW77OPicX79GbAd3GlpVYvsIJ8P6U/58Tv1GOgmmljOkDjpqsPAKq
         M/SZXT0YHTGE8UDF2Kyx2J5iSoGbO4w28Hz0yGqGIfUehha4gsxZhQ/fZ/d+lj2yzB15
         sK0g==
X-Forwarded-Encrypted: i=1; AJvYcCXuuWRGxygiRAwcQo5KwKSdjEmubi5Wz+4sisLKHDIZcvSpZeYFSfXYFFlSexqHZejJao3V3Eej/Z8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlBaO4AFVDGqc2XMh1WGooB6ffkmGD77qXuIpPmdW+NDAQkM3t
	gMDbVBfbYxdOzZq13kC/CPCkyynBppnTHiUw69rrCKei7iac3UYCsWku7lB+JaY=
X-Gm-Gg: ASbGncvS4NnllITDFF0SxeaEw7wb5aAkdsR2N6Aiv4n7fk+B52fexmTfMMds6Y+NLfK
	vwRhJdrClJE5S4D1oBcW2s6OeSe1BjKDgqkc93WyuNdLcXRaCw5Rri9RK8EU9PWVcX3hm3LPXvk
	uXBZ8rwhzhfmHO6BqhjodAZ531ewUh7p4PKiYG03p7zzXhpXHZjK4nBwMiRPm1ygJQffOgTw0fN
	3nqFNky8k261t1+zbGpv5fMoSAKzWcGXTmpaCoi/A66OFU3e9uxzXZW87S4HiZn/fa64PfwqNam
	+HnQlt4WD2sm68GKzS6DA0E4OWQlOFOEXvF0E04vyQ/cqhMcM/w=
X-Google-Smtp-Source: AGHT+IECzWumV9cA1BxSf0fk65MG1v936xTUBe9wcvvYI0imqbHM4JGZ7JFwZqaAyEUGXVqmxzPHUA==
X-Received: by 2002:a05:600c:6612:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-442f96e75eamr14059925e9.12.1747297434909;
        Thu, 15 May 2025 01:23:54 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:53 -0700 (PDT)
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
Subject: [PATCH v7 09/14] riscv: misaligned: move emulated access uniformity check in a function
Date: Thu, 15 May 2025 10:22:10 +0200
Message-ID: <20250515082217.433227-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012356_227147_9A0493B0 
X-CRM114-Status: GOOD (  11.48  )
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
PgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyMCArKysrKysrKysrKysr
Ky0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCmluZGV4IGU1NTFiYTE3ZjU1Ny4uMjg3
ZWMzNzAyMWM4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVk
LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCkBAIC02NDcsNiAr
NjQ3LDE4IEBAIGJvb2wgX19pbml0IGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkX2FsbF9jcHVzKHZvaWQpCiB9CiAjZW5kaWYKIAorc3RhdGljIGJvb2wgYWxsX2NwdXNfdW5h
bGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQodm9pZCkKK3sKKwlpbnQgY3B1OworCisJZm9y
X2VhY2hfb25saW5lX2NwdShjcHUpCisJCWlmIChwZXJfY3B1KG1pc2FsaWduZWRfYWNjZXNzX3Nw
ZWVkLCBjcHUpICE9CisJCSAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFSX0VNVUxB
VEVEKQorCQkJcmV0dXJuIGZhbHNlOworCisJcmV0dXJuIHRydWU7Cit9CisKICNpZmRlZiBDT05G
SUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQKIAogc3RhdGljIGJvb2wgdW5hbGlnbmVkX2N0bCBf
X3JlYWRfbW9zdGx5OwpAQCAtNjg1LDggKzY5Nyw2IEBAIHN0YXRpYyBpbnQgY3B1X29ubGluZV9j
aGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHVuc2lnbmVkIGludCBjcHUpCiAKIGJvb2wg
X19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIHsK
LQlpbnQgY3B1OwotCiAJLyoKIAkgKiBXZSBjYW4gb25seSBzdXBwb3J0IFBSX1VOQUxJR04gY29u
dHJvbHMgaWYgYWxsIENQVXMgaGF2ZSBtaXNhbGlnbmVkCiAJICogYWNjZXNzZXMgZW11bGF0ZWQg
c2luY2UgdGFza3MgcmVxdWVzdGluZyBzdWNoIGNvbnRyb2wgY2FuIHJ1biBvbiBhbnkKQEAgLTY5
NCwxMCArNzA0LDggQEAgYm9vbCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRl
ZF9hbGxfY3B1cyh2b2lkKQogCSAqLwogCW9uX2VhY2hfY3B1KGNoZWNrX3VuYWxpZ25lZF9hY2Nl
c3NfZW11bGF0ZWQsIE5VTEwsIDEpOwogCi0JZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCi0JCWlm
IChwZXJfY3B1KG1pc2FsaWduZWRfYWNjZXNzX3NwZWVkLCBjcHUpCi0JCSAgICAhPSBSSVNDVl9I
V1BST0JFX01JU0FMSUdORURfU0NBTEFSX0VNVUxBVEVEKQotCQkJcmV0dXJuIGZhbHNlOworCWlm
ICghYWxsX2NwdXNfdW5hbGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQoKSkKKwkJcmV0dXJu
IGZhbHNlOwogCiAJdW5hbGlnbmVkX2N0bCA9IHRydWU7CiAJcmV0dXJuIHRydWU7Ci0tIAoyLjQ5
LjAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
