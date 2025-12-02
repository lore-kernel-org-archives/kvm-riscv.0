Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058E7D1171A
	for <kvm-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 17:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5QVKBMBWprZAWpoWTGDQzmzfp7b6nOTb9Pl5yAXxx0=; b=uVwSTwqVF+6ekj
	IFZfJmNj+pTo+M4YVgH8Q+4Ocls4II1iUYZqN7OtEiUQ+YAtWtqT0DVgBEA8DyL0P3fmDtZMT1Sn2
	S6p5irLANX6NpTCnFt68f2JQkq1MsSCXQmBNzhPI1qLVa4FYqR7h38/Jwq0/ms+MD6M3MmZ3fAW4q
	Pz95uiZAOlZaT/LXKQ1y6LSqi/aCLa9rOotkzRaTD7tP8WpCJ/4dqF7xe8ZF+tMFBZLGalenxQJDI
	VZZ19mB79am8pk5fqZ0jEx9To7zielVNzB3PpBhW4/hc4vlgADyfiSr/I6FRvmb20OFvSOQxQJTHv
	OsrHwqUHkU5kdon0F43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQUJu-00000005fy5-1gby;
	Tue, 02 Dec 2025 17:37:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQUJr-00000005fxI-2BI5
	for kvm-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 17:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764697060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cLOFuH88zk7WanwVYUHW+1Ib5oJXEqE5t/gYDwAYMh0=;
	b=XRjtwF2ox5+6JyHyuNQUr4gfwYyiNxd6OnR/c/JRPL34Ro5/Dq6pAfnD5gGX8eEka7fGtH
	lGTQfHr7RBMfU/5GPCmy2j+wOd9HuOZW9cY9dQ3FnmT9kZlVU1Wv073lejYynYTp345/a3
	e4Ynm6TgcLL74/8pUiC3JQETmorM5Zs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-Yxz1G0-sNYG7hFBpZoYRCg-1; Tue, 02 Dec 2025 12:37:39 -0500
X-MC-Unique: Yxz1G0-sNYG7hFBpZoYRCg-1
X-Mimecast-MFC-AGG-ID: Yxz1G0-sNYG7hFBpZoYRCg_1764697058
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42b352355a1so18769f8f.1
        for <kvm-riscv@lists.infradead.org>; Tue, 02 Dec 2025 09:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764697057; x=1765301857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLOFuH88zk7WanwVYUHW+1Ib5oJXEqE5t/gYDwAYMh0=;
        b=tqDxpFuG5JE57cmkfWG7/HHFPKCVzCUDSJUjVuCxTrpipsxYwEH2tHLn+2mc7LtjOz
         uvskrOrteXblT9BiFJQWiEF8GUcDnwcW1WQWynOL5sA04J+y0vvgUywbRlR3IXgiVrU/
         PDq3EaS7eRJHA48ZiaSGfT/1HbHaDiDC8oGTxH1snYwwWoG/+1OpNDOKaa+uYiug1WS8
         6DkxsCruYe+sqhzJuoHjmPwUuhTfMxsb98YCGOr4pffg9hBqg3bjtjUzyV5zzN7XatL4
         aQdlyEJKRR0y2wboenFQW0/CSDB7zgDncKz2ooM6mKiWYC2avMvrglpez7t6nt4bXEBR
         ydRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZMyLleZ6hc/s9+JaOqVM141b7tzdDxheQ/+kYb9eDs+/2kxRqS4GssuOmOg5pQez1jExMHQRhFg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpi0k2zsLmPTZPoD0qyODVUolvKDXHs25QU9vBvF5M88VIxigf
	1U/EPAi7Rn8F+Cv75PrD4OUfBE9fVPDn4QJPmy9LawPlpM+OTnBrU85vZJ8NolHFoW9Mqk7DhoO
	BpFctHCnmfZgOJSTciW6Yk+KHyODcqJ9jvwZm++eOMT4DXbvNcAHFpLHkmEmLkcL4e4H8UjBXYf
	GbT6UwmY5Rvqt8bhoxFz4LdP1SBx1wZEszELnQ2f53jigDHFKLew==
X-Gm-Gg: ASbGncuWyZMg1QI3FmqCeXpFz7O0XTAKVtgAcYYwZWApkgI/YcKMkRJfs2jelwDM5Hh
	BZUENgLjDPbs0pqHCAqdqvJIcqDBpCrJeuYG7gfhYsFZQJsupW32p1EmpUAcZU7U5d8+cKOzP3z
	OM8seGi3j14ihcy8pP7OpITl7YGDpJwj+Y/4InkoZXx5k+eSWwkyCI9f/Bz30OQhbHQzjGx3iiL
	fAez8GNTu2U33piNsWtJdJ3OArkP968rJCrR2ZLbZ2mos9yCEIlgRDToglA7gYNqxiRteQ=
X-Received: by 2002:adf:fed1:0:b0:429:d59e:d097 with SMTP id ffacd0b85a97d-42f6d55b763mr3311180f8f.9.1764697057579;
        Tue, 02 Dec 2025 09:37:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOu7lU4oJsMLifTYK/nBYFoeAg/7lNC7bgBHfCnXxe/HuJXeg9dp2NpOX3PUhDLvhI2i5QxVNIq6XudKgD6Fk=
X-Received: by 2002:adf:fed1:0:b0:429:d59e:d097 with SMTP id
 ffacd0b85a97d-42f6d55b763mr3311151f8f.9.1764697057116; Tue, 02 Dec 2025
 09:37:37 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy3C7zxovYDZJvzpuCytRmdBrGwgLF2MtOMzP7vFVm4ohQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3C7zxovYDZJvzpuCytRmdBrGwgLF2MtOMzP7vFVm4ohQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 2 Dec 2025 18:37:24 +0100
X-Gm-Features: AWmQ_bnNCtSTvfC0nmMqa6ld46mo5a8Ud-lzxCUbyUs1ZEXdESV50Pa9xDGjzqo
Message-ID: <CABgObfZANH3buY3ORqR-T1ND+AP-gJg604nAw87G11=_Toshpw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.19
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Atish Patra <atishp@rivosinc.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LUMMRmroI5GgLaIfHnm_tzkir0bSiinlKGY9bNLCvxE_1764697058
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_093743_625534_229A7751 
X-CRM114-Status: GOOD (  15.36  )
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

T24gRnJpLCBOb3YgMjgsIDIwMjUgYXQgMTI6MDnigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xvLAo+Cj4gV2UgaGF2ZSB0aGUgZm9sbG93aW5n
IEtWTSBSSVNDLVYgY2hhbmdlcyBmb3IgNi4xOToKPiAxKSBTQkkgTVBYWSBzdXBwb3J0IGZvciBL
Vk0gZ3Vlc3QKPiAyKSBOZXcgS1ZNX0VYSVRfRkFJTF9FTlRSWV9OT19WU0ZJTEUKPiAzKSBFbmFi
bGUgZGlydHkgbG9nZ2luZyBncmFkdWFsbHkgaW4gc21hbGwgY2h1bmtzCj4gNCkgRml4IGd1ZXN0
IHBhZ2UgZmF1bHQgd2l0aGluIEhMViogaW5zdHJ1Y3Rpb25zCj4gNSkgRmx1c2ggVlMtc3RhZ2Ug
VExCIGFmdGVyIFZDUFUgbWlncmF0aW9uIGZvciBBbmRlcyBjb3Jlcwo+Cj4gUGxlYXNlIHB1bGwu
CgpQdWxsZWQsIHRoYW5rcy4KClBhb2xvCgo+IFJlZ2FyZHMsCj4gQW51cAo+Cj4gVGhlIGZvbGxv
d2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBhYzNmZDAxZTRjMWVmY2U4ZjJjMDU0Y2RlYjJkZGQy
ZmMwZmIxNTBkOgo+Cj4gICBMaW51eCA2LjE4LXJjNyAoMjAyNS0xMS0yMyAxNDo1MzoxNiAtMDgw
MCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRw
czovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdCB0YWdzL2t2bS1yaXNjdi02LjE5LTEK
Pgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAzMjM5YzUyZmQyMTI1N2M4MDU3OTg3
NWU3NGM5OTU2YzJmOWNkMWY5Ogo+Cj4gICBSSVNDLVY6IEtWTTogRmx1c2ggVlMtc3RhZ2UgVExC
IGFmdGVyIFZDUFUgbWlncmF0aW9uIGZvciBBbmRlcyBjb3Jlcwo+ICgyMDI1LTExLTI0IDA5OjU1
OjM2ICswNTMwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEtWTS9yaXNjdiBjaGFuZ2VzIGZvciA2LjE5Cj4KPiAt
IFNCSSBNUFhZIHN1cHBvcnQgZm9yIEtWTSBndWVzdAo+IC0gTmV3IEtWTV9FWElUX0ZBSUxfRU5U
UllfTk9fVlNGSUxFIGZvciB0aGUgY2FzZSB3aGVuIGluLWtlcm5lbAo+ICAgQUlBIHZpcnR1YWxp
emF0aW9uIGZhaWxzIHRvIGFsbG9jYXRlIElNU0lDIFZTLWZpbGUKPiAtIFN1cHBvcnQgZW5hYmxp
bmcgZGlydHkgbG9nIGdyYWR1YWxseSBpbiBzbWFsbCBjaHVua3MKPiAtIEZpeCBndWVzdCBwYWdl
IGZhdWx0IHdpdGhpbiBITFYqIGluc3RydWN0aW9ucwo+IC0gRmx1c2ggVlMtc3RhZ2UgVExCIGFm
dGVyIFZDUFUgbWlncmF0aW9uIGZvciBBbmRlcyBjb3Jlcwo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEFudXAgUGF0
ZWwgKDQpOgo+ICAgICAgIFJJU0MtVjogS1ZNOiBDb252ZXJ0IGt2bV9yaXNjdl92Y3B1X3NiaV9m
b3J3YXJkKCkgaW50byBleHRlbnNpb24gaGFuZGxlcgo+ICAgICAgIFJJU0MtVjogS1ZNOiBBZGQg
c2VwYXJhdGUgc291cmNlIGZvciBmb3J3YXJkZWQgU0JJIGV4dGVuc2lvbnMKPiAgICAgICBSSVND
LVY6IEtWTTogQWRkIFNCSSBNUFhZIGV4dGVuc2lvbiBzdXBwb3J0IGZvciBHdWVzdAo+ICAgICAg
IEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFNCSSBNUFhZIGV4dGVuc2lvbiB0byBnZXQtcmVn
LWxpc3QKPgo+IEJpbGxYaWFuZyAoMSk6Cj4gICAgICAgUklTQy1WOiBLVk06IEludHJvZHVjZSBL
Vk1fRVhJVF9GQUlMX0VOVFJZX05PX1ZTRklMRQo+Cj4gRG9uZyBZYW5nICgxKToKPiAgICAgICBL
Vk06IHJpc2N2OiBTdXBwb3J0IGVuYWJsaW5nIGRpcnR5IGxvZyBncmFkdWFsbHkgaW4gc21hbGwg
Y2h1bmtzCj4KPiBGYW5neXUgWXUgKDEpOgo+ICAgICAgIFJJU0MtVjogS1ZNOiBGaXggZ3Vlc3Qg
cGFnZSBmYXVsdCB3aXRoaW4gSExWKiBpbnN0cnVjdGlvbnMKPgo+IEh1aSBNaW4gTWluYSBDaG91
ICgxKToKPiAgICAgICBSSVNDLVY6IEtWTTogRmx1c2ggVlMtc3RhZ2UgVExCIGFmdGVyIFZDUFUg
bWlncmF0aW9uIGZvciBBbmRlcyBjb3Jlcwo+Cj4gIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBp
LnJzdCAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX2hvc3QuaCAgICAgICAgICAgICAgICB8ICA2ICsrKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX3RsYi5oICAgICAgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fdmNwdV9zYmkuaCAgICAgICAgICAgIHwgIDUgKysrLQo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2t2bV92bWlkLmggICAgICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICAgICAgICB8ICAzICsrKwo+ICBhcmNo
L3Jpc2N2L2t2bS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIGFy
Y2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4g
IGFyY2gvcmlzY3Yva3ZtL21haW4uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE0ICsr
KysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDUgKysrLQo+ICBhcmNoL3Jpc2N2L2t2bS90bGIuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNw
dS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgYXJjaC9yaXNjdi9rdm0v
dmNwdV9pbnNuLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMjIgKysrKysrKysrKysrKysrCj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICsr
KysrKy0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfYmFzZS5jICAgICAgICAgICAgICAgICAg
IHwgMjggKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9mb3J3
YXJkLmMgICAgICAgICAgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jICAgICAgICAgICAgICAgIHwgMzIgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zeXN0ZW0uYyAgICAg
ICAgICAgICAgICAgfCAgNCArLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfdjAxLmMgICAg
ICAgICAgICAgICAgICAgIHwgIDMgKy0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZtaWQuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDIzIC0tLS0tLS0tLS0tLS0tLS0KPiAgdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIHwgIDQgKysrCj4gIDIxIGZpbGVz
IGNoYW5nZWQsIDEzOCBpbnNlcnRpb25zKCspLCA5NCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2ZvcndhcmQuYwo+CgoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
