Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466C3CAC599
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7BZdgjSGdB7fRMLZk1aVykCN2VGESG0p1xOOwWD/uk=; b=16065q1bP9i6U3
	EZshQZ1xsQjNViPfHNJgATeZWXcQT91VUknzVf6QFc0634Yptr75n8f3fFWKVOb6IJeOfBpJHCoCl
	VnVwpWRwym/uNSJJdm9QEp+BpZLOmYwwt74ULhpzsgs3rPROvik++yK2Pr0xltlJXTpRJeOglbu8s
	XpmCFJdbFdaQagC7czAJDDZPF/IPCAw98/RZyUMNEEunem7BQ+dYfMTVUFcnSY8tVpB+PTrirZQel
	M6OuSGofU/gOn7kRe9zCbMIw5JdgWu7mcNs7Nxth0ppcoDYYVMUNhv0AYjcRSIlyFN4jWs5j6D35x
	ffexgNDrlA8Yy1wcPnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCaX-00000005COY-0D2f;
	Mon, 15 Sep 2025 17:02:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCaT-00000005CMY-3Ez7
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 17:01:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45f2cc29fd8so1898355e9.2
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Sep 2025 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757955716; x=1758560516; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWHHL1s0psJfb//epbwV/zjtkXGJcyLhcOl2Is0sDa4=;
        b=Osg3tlKoonHD5LMEY9pP1UMwDmdzKVnWx1EhuxrFqoHecfDSucPud/qJPVF4qUKgIn
         EeTxcgDI4fYGDhaeSooMHczZYdj7M84RUzCrQgKlKFqHAAy6kzaf9DGzJBd1ea94mER4
         wZaf9TZOLc1j1E17MLSUeTxY8UEqemqqf5zI7zSa1GSYWsS+8AXYhxqP1hDMFyMOSAqX
         RS1mQ1yye91HcWIvCZofoRgj8Y7dQ2y+jbRTv7k5fq9dtVLARgLaa+EBe7x5domuIWjH
         sQ2bvktJXbOFkbv0SuNVROn72dHt3+Vgoeq7i2YGm0nHy+TnojrSLU+HTLs06hGuUE8I
         0KgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757955716; x=1758560516;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DWHHL1s0psJfb//epbwV/zjtkXGJcyLhcOl2Is0sDa4=;
        b=rutox8BKgcUYdCA19furEKdXCaHpuFlc//DCL6lX7P10ZFWK2+mv68WvD30UMxBGzf
         lM+zJkY49b3aL08R1d3LDNKYU8pDJSXA/xeNomsrEpegjFDM7e4W8vY0lgrl6JhpTwnM
         jr1+GsaldNMxB7AlFRpkHyn3jr7t5y/smygQO5K2iUwJ5gyUUYnAwlygZ+CkfD97poOC
         YFOWAXeW3ucQEr37bH3cDIOzfarFqXYuBCTA9HJVDPzDM+I3du5CsT7fJUKw7lEpWt5q
         U/qnB7MY11kscCOM8vIcI7ZpoyypUjjJdgHhQtZgXxFpZ0JIGzmJrzHXXIb1g/BBApSL
         kgNg==
X-Forwarded-Encrypted: i=1; AJvYcCXgfrNwTtC2ok47yRtvhhZSrJruvTgeDWdh06QUGPUnHlOE6yneHTI416abbh6KXIMVKm0sXG9IU4c=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNAsYSK1hYGuGugF1QmC88huMbrJ42m0DFus3qxZaQ3VUgOqZS
	Yti1sSR6QYK1jo8wgq3+CUIiOFoc9QfQ5OJWmsdBJFda0u2ONBYGXhU9SLfRrxSs7/Y=
X-Gm-Gg: ASbGncuT1PL+/duf6pbNA4RMSqu7M/aZXpmRwAnxjCZ0ImdfDqE+h0ay9Wc1VuGJQpE
	59DQyzlRjY9BYFPpcxSGsFKmeYAkYNYoj/l3y0lM4jIsSfRXl/5VAbjBRDvWi1cAOmm46of5X6y
	eSts7DcQcyshLoKf2hYcYEIDCRRiDcF4jqLIFgWQyTM74g6E2VqM6ojFx9KNu117IVc0DGGH7/e
	0pDcpmVDyPXfHmfXwQV2376kTUFBI49zBUPATbJ49fqh/TSW268aNRLkIMLFpKKeoK36/T2xbSr
	Kdb9xuJ+fAot6ixV81TJ/tAV6BVErh78LomP+Vm/LVFdK+Bnqaxz6CCj+RlPLNDIIMxcesvijje
	MVYBAi1M9qd9ayiCcnPBGvg==
X-Google-Smtp-Source: AGHT+IFU1lq2Hn1rhnQ1PXztdy1u0/BZUM8rfqOS080uGF0cxwIiBohWrEivOXB1opFs7TzdP9qSMg==
X-Received: by 2002:a5d:64e3:0:b0:3e6:4b2:b9b2 with SMTP id ffacd0b85a97d-3e7659e936fmr5550562f8f.6.1757955715906;
        Mon, 15 Sep 2025 10:01:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::bfbb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e9c2954b10sm7301300f8f.50.2025.09.15.10.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 10:01:55 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 15 Sep 2025 19:01:03 +0200
Message-Id: <DCTJ9US6E4PG.1MA4ICDR21DS6@ventanamicro.com>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Tianshun Sun" <stsmail163@163.com>
To: "Jinyu Tang" <tjytimi@163.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Yong-Xuan Wang" <yongxuan.wang@sifive.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Nutty Liu" <nutty.liu@hotmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [RFC PATCH] kvm/riscv: Add ctxsstatus and ctxhstatus for
 migration
References: <20250915152731.1371067-1-tjytimi@163.com>
 <DCTJ3N8W4PCL.9XCHFVGS62SF@ventanamicro.com>
In-Reply-To: <DCTJ3N8W4PCL.9XCHFVGS62SF@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_100157_816794_42D4D751 
X-CRM114-Status: UNSURE (   5.71  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

MjAyNS0wOS0xNVQxODo1Mjo1NiswMjowMCwgUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRh
bmFtaWNyby5jb20+Ogo+IDIwMjUtMDktMTVUMjM6Mjc6MzErMDg6MDAsIEppbnl1IFRhbmcgPHRq
eXRpbWlAMTYzLmNvbT46Cj4+ICsJaWYgKHJlZ19udW0gPT0gS1ZNX1JFR19SSVNDVl9DU1JfUkVH
KGN0eGhzdGF0dXMpKQo+PiArCQljc3ItPmN0eGhzdGF0dXMgPSB2Y3B1LT5hcmNoLmd1ZXN0X2Nv
bnRleHQuaHN0YXR1czsKPgo+IE5laXRoZXIgc2hvdWxkIHVzZXJzcGFjZSBiZSBhYmxlIHRvIGRp
cmVjdGx5IHNldCBoc3RhdHVzLgo+IEtWTSBzaG91bGQgZGVyaXZlIGl0IGZyb20gb3RoZXIgdXNl
cnNwYWNlIGNvbmZpZ3VyYXRpb24uCj4KPiBXaGF0IGlzbid0IGNvcnJlY3RseSByZWZsZWN0ZWQg
aW4gaHN0YXR1cz8KCkFoLCB3ZSBkb24ndCBzZXQgaHN0YXR1cy5TUFZQIHdoZW4gc2V0dGluZyBL
Vk1fUkVHX1JJU0NWX0NPUkVfUkVHKG1vZGUpLgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
