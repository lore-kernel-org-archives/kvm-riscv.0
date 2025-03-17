Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36539C35FFA
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8L5y8vrJEQazWPsU4afRsGurRI5hCCowrsLNdNq07k=; b=FTgzJoaZZR+E4z
	K4467pyDTM7X1mVLSobz68D9YOxh6oMxiEKynYaP03hyJAD3dcPx83CoOrf+XXS7+7ZjJ6jgzyG8Q
	hpuYsJCJYtqHm8Hy97JD0cdq2vlGdx+zoNJkZC+TcRRQJQ3DF6DALxqsn+r+//q15Q0vQjjI5WBRA
	DhBHeTFng0r2a6+0bcYL0qN9Ir4Bnit5U7uXLHBINLgo4kFYYEBqwR32tD9HgT9LzM76RBLbLE/+Z
	RrZD8KPjA5NmDGc2nOJEBG0AHGSAwcu0wH5kS1mSG0b4htHfAORl0S0BRRRFjRvnx6pf3FRr3/D9a
	09n55z6jFBvgGQPH2jIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1T-00000003V2y-2z65;
	Mon, 17 Mar 2025 17:13:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwn-00000003TSp-00eH
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so20959535e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231296; x=1742836096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AU7F+Sv/M47Pn2Qo6/tW45mjDMKI8ET1F5gpFniyHfw=;
        b=XvOqAcqW3EODMwaL38JCt+9VYNoTPC7k1h7c+rESb6sP6w9+OXuoYJUsxIYNd7MRzZ
         GGJKfSg23AsGOvaKntKUoZh7F2j4FMi5rWbi6ueC0eCgJLraIV0pX3y9rcxLJhZFl4ox
         svLiXuq6ZYT4Z4EFNeqb6Br0HYIKwLGggPMR93DXFblJ/OF6/gBnKdrJaEj7ES/cgsZS
         +zawXHGmdR8m/WIKFN0hAhPjLE8xq4uzpSjkrda6DTXBXRuoyrMWXuHxhoYNIG6k9upO
         1EhgWCYBRwuchOg3ZKW+gwy+RSxjt4xKPBzX0rNqfjrCKVMDIvJdrIRuMmpLq6m8Xqqw
         Iuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231296; x=1742836096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AU7F+Sv/M47Pn2Qo6/tW45mjDMKI8ET1F5gpFniyHfw=;
        b=PbPd8r60vFhq+WxFXwO9rOAxbqfvgtPfN9i9a25ErESXbZy0SQoEJ+YLYuCKOtPtH8
         l2Jcv8JLeE5epb7vo/Guk+M8s9n/hd7R7cWhq/3Kk9sPJbfHfP51iDna8yxQengSHHo3
         qU8aLpK8l5fiSuQj4AxzqkfYe3Z5j1Z+HL/bOgLla3H4V+JdTIXlcRcHVDPcuwG85bMi
         G6Qb53h7RuvaqQ43JxKuaFcMQksl63DXeAhzECipSV3P4V19nFZ0TJsg4OlaRzddcKdg
         IE38/nOvZN7uCODbbJZH6kgMhA26UdOU3OaZECrVpLijArTK9PFUhHd/MSwk1ydWMstL
         X1AA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ6KKQ+laGM3wq7MBS4rYnb689/jivaZ/sVWlSuWVOBawy5hlInn8a9vuwMOlYfMNUGcHqxwlgT/A=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzXdS0tmvqYqvSw8E1k7Tc4pomvRdcVg9X0M+nlJ7Wo9nPUxC9
	jyhzDmfrWTHwYoKabXw/vsX/f5lRelTHXoJK0b8kunG4TqPdoVMkxBq2QYbHvXE=
X-Gm-Gg: ASbGnctSwuoCJxPiw7kU4L6/U250vRRRfnO5+I27BKVOy+5yw+Y3MUpNtlgt3SR6WvC
	tPJ71L6j/AJjbBEwyHakPL7gJy9nXZ0d6zrFb1GSxnsLnL6M/2aX2zYz6HzfSBlbkJoYwZxzj+b
	IHGl3yVA/V+l03KQ8sukuM53Rw7tf3VNxMIsPDZ6kdqsYSyJHlVtpgKge4X+siI3xSDA3v51wv2
	jhv9zovQPIlUVPFfjtIg7JyLCla6dUEpVZhmsDX39if9NhJ0W6m7lfnTiZQmEgNLmlhykyOT94E
	0eIjTuGUT/R9nRIojMAwZI5caM044Cqjjd1GghHpWyRGCA==
X-Google-Smtp-Source: AGHT+IGpDbXWpDYRUzGh2bTIaNirJTVxXi2O+kKj5FZQdCmID2IJ/McRsJVBPF2vymf5U0IMdZpfhQ==
X-Received: by 2002:a05:600c:3b9f:b0:43d:94:cff0 with SMTP id 5b1f17b1804b1-43d1ecd83demr128705695e9.19.1742231295702;
        Mon, 17 Mar 2025 10:08:15 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:15 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 08/18] riscv: misaligned: move emulated access uniformity check in a function
Date: Mon, 17 Mar 2025 18:06:14 +0100
Message-ID: <20250317170625.1142870-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100817_059732_C64FBC21 
X-CRM114-Status: GOOD (  11.23  )
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
CiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAxOCArKysrKysrKysrKysr
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCA4MTc1YjM0NDliNzMuLjNjNzdm
Yzc4ZmU0ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtNjcyLDEwICs2
NzIsMjAgQEAgc3RhdGljIGludCBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11
bGF0ZWQodW5zaWduZWQgaW50IGNwdSkKIAlyZXR1cm4gMDsKIH0KIAotYm9vbCBjaGVja191bmFs
aWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCitzdGF0aWMgYm9vbCBhbGxfY3B1
c191bmFsaWduZWRfc2NhbGFyX2FjY2Vzc19lbXVsYXRlZCh2b2lkKQogewogCWludCBjcHU7CiAK
Kwlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKKwkJaWYgKHBlcl9jcHUobWlzYWxpZ25lZF9hY2Nl
c3Nfc3BlZWQsIGNwdSkgIT0KKwkJICAgIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJf
RU1VTEFURUQpCisJCQlyZXR1cm4gZmFsc2U7CisKKwlyZXR1cm4gdHJ1ZTsKK30KKworYm9vbCBj
aGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCit7CiAJLyoKIAkg
KiBXZSBjYW4gb25seSBzdXBwb3J0IFBSX1VOQUxJR04gY29udHJvbHMgaWYgYWxsIENQVXMgaGF2
ZSBtaXNhbGlnbmVkCiAJICogYWNjZXNzZXMgZW11bGF0ZWQgc2luY2UgdGFza3MgcmVxdWVzdGlu
ZyBzdWNoIGNvbnRyb2wgY2FuIHJ1biBvbiBhbnkKQEAgLTY4MywxMCArNjkzLDggQEAgYm9vbCBj
aGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiAJICovCiAJb25f
ZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCwgTlVMTCwgMSk7CiAKLQlm
b3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKLQkJaWYgKHBlcl9jcHUobWlzYWxpZ25lZF9hY2Nlc3Nf
c3BlZWQsIGNwdSkKLQkJICAgICE9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfRU1V
TEFURUQpCi0JCQlyZXR1cm4gZmFsc2U7CisJaWYgKCFhbGxfY3B1c191bmFsaWduZWRfc2NhbGFy
X2FjY2Vzc19lbXVsYXRlZCgpKQorCQlyZXR1cm4gZmFsc2U7CiAKIAl1bmFsaWduZWRfY3RsID0g
dHJ1ZTsKIAlyZXR1cm4gdHJ1ZTsKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
