Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDECC28B30
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 23:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLdI4Inwy1Z7cFAeYfoKlhp/nZK7fuCtBXPkhC/uiyw=; b=Yg0aAV1Sq9QJ2k
	OIS3bevKNM8vEE5WvReB1nIHCLJO2GSEbVa60GL8IZQnXxh/qO3GDbyEr8ZFVidy/7HfaPZUWISt7
	uPK5/58JHMzZScmbul23rfJTdi1uciznTqnB9t0HL1FIQlLNihORfOBaEtqEzMhCvhWS1UriPObsx
	43FNI1Ls2+JqQPvlLMLZn7cbPIueS7W/EsdUpgd4oKowApRWn2V/iII6tuOeOjpxQK6fiDEXInlan
	J5AL6AsNDCuTIpWXLylpaniHFF/1hX/29RbUXGy6V2t9x1N5/UFrPjm+43ZrN3e4tW+2Zv6E/Q7+P
	RUx07Gn2v7IEp7iuorTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvPYi-0000000DTt1-38ge;
	Thu, 20 Mar 2025 23:44:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvPYg-0000000DTrZ-15zx
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 23:44:19 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-225b5448519so26721835ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 20 Mar 2025 16:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742514257; x=1743119057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sx9RFbFhV18UVxcJVn2E8kE6xVU3d+kjpx4dubf4KQY=;
        b=pXSGCIi0N8IjhsZq/Kxyl8gTtNXhuu3E7KTz7+/fF8MQItKcXjSO6cFEJwAuwwxxy7
         Cozf/Va+jJ8HXjIEn9aixYI3FynDyuHUa9ktYN6T88yAc1qWvPCtCvZcqdgTD/R5LGo3
         +kNX3pHA4oN+nNQHV27C1hgLdbO/+7BPssz9z8LwjdZpDwbRtsJkd7RUj6TpCURF9klQ
         xDSY9QsmAN7uGhoPA+MT/pmlNgwH66zN2RqGURN57K2Bl6rkDonaV/wkWcFeFbMW20qQ
         onCUnHVcxh1xGI8v0DGrpZ32OgbouIiXtp1u3m1qRnBuiD4c4IXNDoaDpoCxpBBH6CjC
         ZMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742514257; x=1743119057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sx9RFbFhV18UVxcJVn2E8kE6xVU3d+kjpx4dubf4KQY=;
        b=NQo6lbL3wWAx1uASS4hvxilrbLzRb4Y/kHnMYCS7M8xCeMbH49hUbWq6yAA3v8gisV
         YtgNAhssk4mIMkR3rRJDJgvPJoc7yXcI48svdn8X2sy0xoW/9dEa6g36UJuTqG5w1K0B
         jG6c8aEW1zPaFf+OWjXC6awsPKcDCixae9UJR1A4zirP6ZMs0Ph1lEEGCoJJA6YTZ+lO
         tcb/yFTPYQf7Og7AjXi6EFhjGfTq1MIdO9VaJR8KW4TpV5AxHfIMf1WiqEzRHPd9beHf
         nBygPsMieFkm2sOjAbl264ayoGYAR1hf+3tdAhCA98ioxd1yJZiNSfF6Gn3cLQPhoreg
         PcWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQdQZ9mN1DNPjP4GdbTh2ZtAr4KGI0ZOOOs5XVXSLfGWrP12Z8oOd/XxsOhVOXFvDFtenvObokJVo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTxeNmKcJEkUx6zXeMpTo35PeuZx+C+zIOO14nWhpenSB6Dqgq
	UNklpgLPUijfB2rr8TjyA2o0MWf39iuNd5HtaWsDCl3Z2wtQJEuk0c4v8h/mNrlhgQxTTQYeWzT
	MG9rQrse7jmVpRdG/30OTqZnIDhleHe/fTMwF5Q==
X-Gm-Gg: ASbGncvSooG/V9TbFeC5XE5aPMa5X3my/egh0zkCM0WMdRKllAnyXfH+RIZEiMa9QpL
	v/eSePoa+BJ3M+5YI3qy4UkDr9tdenZZOF1pVb58agTs0y3PmUunDJwCrJCVWr6QHxMZlGMyrYp
	HvNcxci0/GxXa48D7VUzjdVYGt
X-Google-Smtp-Source: AGHT+IHZLYL66qJW18COX6JZ7o2M448VXcpFC9tv/3ygvfrm/plvo7x5Xd4P6IHJW/2EPCNgKPKtCGWglcvBlvp8pYg=
X-Received: by 2002:a17:90b:28c4:b0:2fe:a742:51b0 with SMTP id
 98e67ed59e1d1-3031002af0fmr1663139a91.31.1742514256837; Thu, 20 Mar 2025
 16:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250317-kvm_exit_fix-v1-1-aa5240c5dbd2@rivosinc.com> <Z9hI5vEHngcKvvRa@google.com>
In-Reply-To: <Z9hI5vEHngcKvvRa@google.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 20 Mar 2025 16:44:05 -0700
X-Gm-Features: AQ5f1JqRewenHnUHTLoLyUK3jy666k2pQWgIEFEkTaIpT0EXNn1CrZi3jTO1WxM
Message-ID: <CAHBxVyFLeZFwEnJYa-oUbAKVimdVsr=Ct76Jf=TyWeoAkHe8yQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Teardown riscv specific bits after kvm_exit
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <apatel@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_164418_571115_BF4B085B 
X-CRM114-Status: GOOD (  23.95  )
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

T24gTW9uLCBNYXIgMTcsIDIwMjUgYXQgOTowOOKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgTWFyIDE3LCAyMDI1LCBBdGlzaCBQ
YXRyYSB3cm90ZToKPiA+IER1cmluZyBhIG1vZHVsZSByZW1vdmFsLCBrdm1fZXhpdCBpbnZva2Vz
IGFyY2ggc3BlY2lmaWMgZGlzYWJsZQo+ID4gY2FsbCB3aGljaCBkaXNhYmxlcyBBSUEuIEhvd2V2
ZXIsIHdlIGludm9rZSBhaWFfZXhpdCBiZWZvcmUga3ZtX2V4aXQKPiA+IHJlc3VsdGluZyBpbiB0
aGUgZm9sbG93aW5nIHdhcm5pbmcuIEtWTSBrZXJuZWwgbW9kdWxlIGNhbid0IGJlIGluc2VydGVk
Cj4gPiBhZnRlcndhcmRzIGR1ZSB0byBpbmNvbnNpc3RlbnQgc3RhdGUgb2YgSVJRLgo+ID4KPiA+
IFsyNTQ2OS4wMzEzODldIHBlcmNwdSBJUlEgMzEgc3RpbGwgZW5hYmxlZCBvbiBDUFUwIQo+ID4g
WzI1NDY5LjAzMTczMl0gV0FSTklORzogQ1BVOiAzIFBJRDogOTQzIGF0IGtlcm5lbC9pcnEvbWFu
YWdlLmM6MjQ3NiBfX2ZyZWVfcGVyY3B1X2lycSsweGEyLzB4MTUwCj4gPiBbMjU0NjkuMDMxODA0
XSBNb2R1bGVzIGxpbmtlZCBpbjoga3ZtKC0pCj4gPiBbMjU0NjkuMDMxODQ4XSBDUFU6IDMgVUlE
OiAwIFBJRDogOTQzIENvbW06IHJtbW9kIE5vdCB0YWludGVkIDYuMTQuMC1yYzUtMDY5NDctZzkx
Yzc2MzExOGY0Ny1kaXJ0eSAjMgo+ID4gWzI1NDY5LjAzMTkwNV0gSGFyZHdhcmUgbmFtZTogcmlz
Y3YtdmlydGlvLHFlbXUgKERUKQo+ID4gWzI1NDY5LjAzMTkyOF0gZXBjIDogX19mcmVlX3BlcmNw
dV9pcnErMHhhMi8weDE1MAo+ID4gWzI1NDY5LjAzMTk3Nl0gIHJhIDogX19mcmVlX3BlcmNwdV9p
cnErMHhhMi8weDE1MAo+ID4gWzI1NDY5LjAzMjE5N10gZXBjIDogZmZmZmZmZmY4MDA3ZGIxZSBy
YSA6IGZmZmZmZmZmODAwN2RiMWUgc3AgOiBmZjIwMDAwMDAwODhiZDUwCj4gPiBbMjU0NjkuMDMy
MjQxXSAgZ3AgOiBmZmZmZmZmZjgxMzFjZWY4IHRwIDogZmY2MDAwMDA4MGI5NjQwMCB0MCA6IGZm
MjAwMDAwMDA4OGJhZjgKPiA+IFsyNTQ2OS4wMzIyODVdICB0MSA6IGZmZmZmZmZmZmZmZmZmZmMg
dDIgOiA1MjQ5MjA3NTcwNjM3MjY1IHMwIDogZmYyMDAwMDAwMDg4YmQ5MAo+ID4gWzI1NDY5LjAz
MjMyOV0gIHMxIDogZmY2MDAwMDA5OGIyMTA4MCBhMCA6IDAzN2Q1MjdhMTVlYjRmMDAgYTEgOiAw
MzdkNTI3YTE1ZWI0ZjAwCj4gPiBbMjU0NjkuMDMyMzcyXSAgYTIgOiAwMDAwMDAwMDAwMDAwMDIz
IGEzIDogMDAwMDAwMDAwMDAwMDAwMSBhNCA6IGZmZmZmZmZmODEyMmRiZjgKPiA+IFsyNTQ2OS4w
MzI0MTBdICBhNSA6IDAwMDAwMDAwMDAwMDBmZmYgYTYgOiAwMDAwMDAwMDAwMDAwMDAwIGE3IDog
ZmZmZmZmZmY4MTIyZGMxMAo+ID4gWzI1NDY5LjAzMjQ0OF0gIHMyIDogZmY2MDAwMDA4MGMyMmVi
MCBzMyA6IDAwMDAwMDAyMDAwMDAwMjIgczQgOiAwMDAwMDAwMDAwMDAwMDFmCj4gPiBbMjU0Njku
MDMyNDg4XSAgczUgOiBmZjYwMDAwMDgwYzIyZTAwIHM2IDogZmZmZmZmZmY4MGMzNTFjMCBzNyA6
IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsyNTQ2OS4wMzI1ODJdICBzOCA6IDAwMDAwMDAwMDAwMDAw
MDMgczkgOiAwMDAwNTU1NTZiN2ZiNDkwIHMxMDogMDAwMDdmZmZmMGUxMmZhMAo+ID4gWzI1NDY5
LjAzMjYyMV0gIHMxMTogMDAwMDdmZmZmMGUxM2U5YSB0MyA6IGZmZmZmZmZmODEzNTRhYzcgdDQg
OiBmZmZmZmZmZjgxMzU0YWM3Cj4gPiBbMjU0NjkuMDMyNjY0XSAgdDUgOiBmZmZmZmZmZjgxMzU0
YWM4IHQ2IDogZmZmZmZmZmY4MTM1NGFjNwo+ID4gWzI1NDY5LjAzMjY5OF0gc3RhdHVzOiAwMDAw
MDAwMjAwMDAwMTAwIGJhZGFkZHI6IGZmZmZmZmZmODAwN2RiMWUgY2F1c2U6IDAwMDAwMDAwMDAw
MDAwMDMKPiA+IFsyNTQ2OS4wMzI3MzhdIFs8ZmZmZmZmZmY4MDA3ZGIxZT5dIF9fZnJlZV9wZXJj
cHVfaXJxKzB4YTIvMHgxNTAKPiA+IFsyNTQ2OS4wMzI3OTddIFs8ZmZmZmZmZmY4MDA3ZGJmYz5d
IGZyZWVfcGVyY3B1X2lycSsweDMwLzB4NWUKPiA+IFsyNTQ2OS4wMzI4NTZdIFs8ZmZmZmZmZmYw
MTNhNTdkYz5dIGt2bV9yaXNjdl9haWFfZXhpdCsweDQwLzB4NDIgW2t2bV0KPiA+IFsyNTQ2OS4w
MzM5NDddIFs8ZmZmZmZmZmYwMTNiNGU4Mj5dIGNsZWFudXBfbW9kdWxlKzB4MTAvMHgzMiBba3Zt
XQo+ID4gWzI1NDY5LjAzNTMwMF0gWzxmZmZmZmZmZjgwMDliMTUwPl0gX19yaXNjdl9zeXNfZGVs
ZXRlX21vZHVsZSsweDE4ZS8weDFmYwo+ID4gWzI1NDY5LjAzNTM3NF0gWzxmZmZmZmZmZjgwMDBj
MWNhPl0gc3lzY2FsbF9oYW5kbGVyKzB4M2EvMHg0Ngo+ID4gWzI1NDY5LjAzNTQ1Nl0gWzxmZmZm
ZmZmZjgwOWVjOWE0Pl0gZG9fdHJhcF9lY2FsbF91KzB4NzIvMHgxMzQKPiA+IFsyNTQ2OS4wMzU1
MzZdIFs8ZmZmZmZmZmY4MDlmNWUxOD5dIGhhbmRsZV9leGNlcHRpb24rMHgxNDgvMHgxNTYKPiA+
Cj4gPiBJbnZva2UgYWlhX2V4aXQgYW5kIG90aGVyIGFyY2ggc3BlY2lmaWMgY2xlYW51cCBmdW5j
dGlvbnMgYWZ0ZXIga3ZtX2V4aXQKPiA+IHNvIHRoYXQgZGlzYWJsZSBnZXRzIGEgY2hhbmNlIHRv
IGJlIGNhbGxlZCBmaXJzdCBiZWZvcmUgZXhpdC4KPiA+Cj4gPiBGaXhlczogNTRlNDMzMjBjMmJh
ICgiUklTQy1WOiBLVk06IEluaXRpYWwgc2tlbGV0YWwgc3VwcG9ydCBmb3IgQUlBIikKPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+IC0t
LQo+Cj4gRldJVywKPgo+IFJldmlld2VkLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KPgo+ID4gIGFyY2gvcmlzY3Yva3ZtL21haW4uYyB8IDQgKystLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL21haW4uYyBiL2FyY2gvcmlzY3Yva3ZtL21haW4uYwo+
ID4gaW5kZXggMWZhOGJlNWVlNTA5Li40YjI0NzA1ZGM2M2EgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2t2bS9tYWluLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL21haW4uYwo+ID4gQEAg
LTE3Miw4ICsxNzIsOCBAQCBtb2R1bGVfaW5pdChyaXNjdl9rdm1faW5pdCk7Cj4gPgo+ID4gIHN0
YXRpYyB2b2lkIF9fZXhpdCByaXNjdl9rdm1fZXhpdCh2b2lkKQo+ID4gIHsKPiA+IC0gICAgIGt2
bV9yaXNjdl90ZWFyZG93bigpOwo+ID4gLQo+ID4gICAgICAga3ZtX2V4aXQoKTsKPiA+ICsKPiA+
ICsgICAgIGt2bV9yaXNjdl90ZWFyZG93bigpOwo+Cj4gSSB3b25kZXIgaWYgdGhlcmUncyBhIHdh
eSB3ZSBjYW4gZ3VhcmQgYWdhaW5zdCBrdm1faW5pdCgpL2t2bV9leGl0KCkgYmVpbmcgY2FsbGVk
Cj4gdG9vIGVhcmx5L2xhdGUuICB4ODYgaGFkIHNpbWlsYXIgYnVncyBmb3IgYSB2ZXJ5IGxvbmcg
dGltZSwgZS5nLiBzZWUgY29tbWl0Cj4gZTMyYjEyMDA3MWVhICgiS1ZNOiBWTVg6IERvIF9hbGxf
IGluaXRpYWxpemF0aW9uIGJlZm9yZSBleHBvc2luZyAvZGV2L2t2bSB0byB1c2Vyc3BhY2UiKS4K
Pgo+IEUuZy4gbWF5YmUgd2UgZG8gc29tZXRoaW5nIGxpa2UgY3JlYXRlK2Rlc3Ryb3kgYSBWTSBh
dCB0aGUgZW5kIG9mIGt2bV9pbml0KCkgYW5kCj4gdGhlIGJlZ2lubmluZyBvZiBrdm1fZXhpdCgp
PyAgTm90IHN1cmUgaWYgdGhhdCB3b3VsZCB3b3JrIGZvciBrdm1fZXhpdCgpLCBidXQgaXQKPiBz
aG91bGQgZGVmaW5pdGVseSBiZSBmaW5lIGZvciBrdm1faW5pdCgpLgo+Clllcy4gVGhhdCB3b3Vs
ZCBiZSBzdXBlciB1c2VmdWwuIEkgYW0gbm90IHN1cmUgYWJvdXQgdGhlIGV4YWN0Cm1lY2hhbmlz
bSB0byBhY2hpZXZlIHRoYXQgdGhvdWdoLgpEbyB5b3UganVzdCB0ZXN0IGNvZGUgZ3VhcmRlZCB3
aXRoaW4gYSBuZXcgY29uZmlnIHRoYXQganVzdApjcmVhdGVzL2Rlc3Ryb3lzIGEgZHVtbXkgVk0g
PwoKTWF5IGJlIGt1bml0IHRlc3QgZm9yIEtWTSBmaXRzIGhlcmUgaW4gc29tZSB3YXkgPwoKPiBJ
dCB3b3VsZG4ndCBwcmV2ZW50IGJ1Z3MsIGJ1dCBtYXliZSBpdCB3b3VsZCBoZWxwIGRldGVjdCB0
aGVtIGR1cmluZyBkZXZlbG9wbWVudD8KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
