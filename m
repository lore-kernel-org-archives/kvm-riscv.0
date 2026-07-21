Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9B0C44529
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uTW+s6vjsCaVCOIgpZJyJ6vJIhYCt01bldrPK6JAcA=; b=ZsX+0WgCJFROHn
	mMFPYVSBcjuK+vytm+/Yt1BZ6SO37guQjCBpIP8e+4oc1aOqIqURHyDeuPtOZ847ArJWmnjItYqNe
	5zPW6MNEQ9vGYZaIBsMTW/Ixz9PrFliMADJAujCDE88VVyLVX+SlTiWGpzzfIvvqMBUraz5Eul0y8
	fPIkcXkoO0P5ItRhWMZ+Au1IE+wIknc4HUFbqlgQAjfsLt6uNFaZSwG2HoHwCnu6ONRK86HI1lwBL
	FcbpVgoAtP9VjYszoscyQtL2Qik///0pa8RD2GNJBmQtF1urx0SA9745CRipzuQPPRop/VZdDY2LU
	gVP8BNBdj+5JzwrEIWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7QC-000000094HR-0rnA;
	Tue, 21 Jul 2026 10:09:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7Q9-000000094FZ-20mZ
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 10:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784628592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X/LcZsIYEi/WvQwQWFUmWBxrZuJIg8BbyzJ3Kz0eMgA=;
	b=IwvrskILpxNUAD4bE0uhsugXFHaV2WvLZkgHICj2qnFdFA0U43HlH1cTpYlLosJnda940x
	ywbspYf7vJgt7LEQEcSYUdCf4Q4n+aRidNshQIkNoQE9qiT7kbKXxF+5sxQ06uxjFHtPuH
	rl+yHEwAfBhaEvbfkwA6mBHo9n5rLGY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-J0QfwiyhNzeEZt6savrbrA-1; Tue, 21 Jul 2026 06:09:45 -0400
X-MC-Unique: J0QfwiyhNzeEZt6savrbrA-1
X-Mimecast-MFC-AGG-ID: J0QfwiyhNzeEZt6savrbrA_1784628585
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-475e540a0ffso6338242f8f.3
        for <kvm-riscv@lists.infradead.org>; Tue, 21 Jul 2026 03:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628584; x=1785233384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/LcZsIYEi/WvQwQWFUmWBxrZuJIg8BbyzJ3Kz0eMgA=;
        b=DHxTRTc1cJiRMwUSgACvS0RZwwRY1MOSwHjicmhbLrmA1Ubk+0CQq50rgRE+dbQHyb
         dBsTnOMdtEzxOpa7C5z0VSVFs8vItAmZYD1DdfSlHLC+unvVNRS9lGwrhB+HS/T2rk9C
         W3OvzFW3dt0IDgwm3/F03zd8/ThgMnKu+qy3GfgC400LNHp+go7/Ntp6G4yBo27MCiSI
         gKbLh1s70m9L/qls07p5Q/XWn5UowIO2jT0Qx9xzKXyHL30JV6vekydWwGrpUZiTGg3Q
         BCZVCxu72KpJNElTutP+lL2ojK5yjg7JduxREk88/tz86MFJ7t2hoa5otdTRP5aaPR5C
         nmbw==
X-Forwarded-Encrypted: i=1; AHgh+RpqO93aZPQIhCiBP+eQMBfCtnJMPgaBTsr960x99WH1QAlj9TdvaAo81NaKAsLO1Pk0JJv/QaiMG40=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWfy7Q42iN2ZbS4hag+8F2taVWeRhAs+h1kNlbztGWZ2dTxN9E
	8XaLESM+B1eRxVQyb0YI4lffptZ/5H7K8daLhHcEYSt+o9fiHhyifx7pc3P0dPGBjJRaWOTwGW4
	VU+iSUvGxW3lEwV6sE85UOk77NTv72tR9CDY5u3BZUNalJSds6SmPDyqLiIBJafzejkq5+O0vwn
	c724PMqnOGwHcgTDyPgt3LS2ueJFQD1+tVoPnYhye2nA==
X-Gm-Gg: AfdE7clQ1abHChEqWb7u57J6TwjS02upA9a6uJm3PRzWxfnxW7uQ+uAfhwV1au93DuF
	OZgoKb3c9gIiw6FNLm2Diq/vrthZy8O0DLcGxH88N/3IcGIYvvKSl3g/s9VdANrGx3ZjVGmLOLy
	EllJotnJ+zhDfpc4qZhHnIzW43ZsmOxxeCIvnoc5ce6Gbhh65teABHIVP6sydVmnGerXOZA9tMJ
	srrD1aDbVjQZkvnZ+N318EdPu442hkrnaBNLOXHndAaaGURxZf8G4cs8h2e
X-Received: by 2002:a05:600c:4ed0:b0:493:c634:952 with SMTP id 5b1f17b1804b1-4954a3d0872mr196477855e9.7.1784628583606;
        Tue, 21 Jul 2026 03:09:43 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed0:b0:493:c634:952 with SMTP id
 5b1f17b1804b1-4954a3d0872mr196477225e9.7.1784628582637; Tue, 21 Jul 2026
 03:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2iT3GmYz+n_jzbQ4V_5P7UdfFhmq=BSOgYCDEQ6PPuZA@mail.gmail.com>
In-Reply-To: <CAAhSdy2iT3GmYz+n_jzbQ4V_5P7UdfFhmq=BSOgYCDEQ6PPuZA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 21 Jul 2026 12:09:29 +0200
X-Gm-Features: AUfX_mzqp4co9SVxJ6Oxz0wZJjADoZUw52gPjsL2VGGBD-drbZ_ihcWCOMvdB5w
Message-ID: <CABgObfb5KVNVBj9bDbcW5Y0WFYvC0A33-GBoy_UKuWUMPCBQhQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 7.2 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z-lcA5lDMPV-yturHdsXbQn2afmmV-mnSoEiu-OVFqQ_1784628585
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_030953_610295_AA3F45A3 
X-CRM114-Status: GOOD (  13.31  )
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

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTA6MDPigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xvLAo+Cj4gV2UgaGF2ZSB0aGUgZm9sbG93aW5n
IGZpeGVzIGZvciB0aGUgNy4yIGtlcm5lbDoKPiAxKSBBdm9pZCByZWR1bmRhbnQgcGFnZS10YWJs
ZSBhbGxvY2F0aW9ucyBpbiBpb3JlbWFwIHBjYWNoZSB0b3B1cAo+IDIpIEFwcGx5IFNCSSBGV0ZU
IExPQ0sgZmxhZyBvbmx5IG9uIHN1Y2Nlc3NmdWwgc2V0Cj4gMykgQm91bmQgU0JJIFBNVSBjb3Vu
dGVyIG1hc2sgc2NhbiB0byBCSVRTX1BFUl9MT05HCj4gNCkgU2tpcCBUTEIgZmx1c2ggd2hlbiBH
LXN0YWdlIFBURSBiZWNvbWVzIHZhbGlkIHdpdGggU3Z2cHRjCj4gNSkgWmljYm9bbXx6fHBdIGJs
b2NrIHNpemVzIHNob3VsZCBiZSBhbHdheXMgcHJlc2VudCBpbiBPTkVfUkVHCj4gNikgSW5qZWN0
IGluc3RydWN0aW9uIGFjY2VzcyBmYXVsdCBvbiB1bm1hcHBlZCBndWVzdCBmZXRjaAo+IDcpIFNl
cmlhbGl6ZSB2aXJ0dWFsIGludGVycnVwdCBwZW5kaW5nIHN0YXRlIHVwZGF0ZXMgdXNpbmcgYSBy
YXcgc3BpbmxvY2sKPiA4KSBGaXggU3BlY3RyZS12MSBpbiB2ZWN0b3IgcmVnaXN0ZXIgYWNjZXNz
IHZpYSBPTkVfUkVHCgpQdWxsZWQsIHRoYW5rcy4KClBhb2xvCgo+Cj4gUGxlYXNlIHB1bGwuCj4K
PiBSZWdhcmRzLAo+IEFudXAKPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQg
YTEzYzE0MGNjMjg5YzBiN2IzNzcwYmNlNWIzYWQ0MmFiMzUwNzRhYToKPgo+ICAgTGludXggNy4y
LXJjMyAoMjAyNi0wNy0xMiAxNDoxNjozOSAtMDcwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhl
IEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xp
bnV4LmdpdCB0YWdzL2t2bS1yaXNjdi1maXhlcy03LjItMQo+Cj4gZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIDhkOWM5YjEzNWI1YzIzZGU5ODExYTg0MjYyNTdjYmQyZmEwMjRhOTk6Cj4K
PiAgIEtWTTogcmlzY3Y6IEZpeCBTcGVjdHJlLXYxIGluIHZlY3RvciByZWdpc3RlciBhY2Nlc3Mg
KDIwMjYtMDctMTUKPiAxODowNjoxNiArMDUzMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlzY3YgZml4
ZXMgZm9yIDcuMiwgdGFrZSAjMQo+Cj4gLSBBdm9pZCByZWR1bmRhbnQgcGFnZS10YWJsZSBhbGxv
Y2F0aW9ucyBpbiBpb3JlbWFwIHBjYWNoZSB0b3B1cAo+IC0gQXBwbHkgU0JJIEZXRlQgTE9DSyBm
bGFnIG9ubHkgb24gc3VjY2Vzc2Z1bCBzZXQKPiAtIEJvdW5kIFNCSSBQTVUgY291bnRlciBtYXNr
IHNjYW4gdG8gQklUU19QRVJfTE9ORwo+IC0gU2tpcCBUTEIgZmx1c2ggd2hlbiBHLXN0YWdlIFBU
RSBiZWNvbWVzIHZhbGlkIHdpdGggU3Z2cHRjCj4gLSBaaWNib1ttfHp8cF0gYmxvY2sgc2l6ZXMg
c2hvdWxkIGJlIGFsd2F5cyBwcmVzZW50IGluIE9ORV9SRUcKPiAtIEluamVjdCBpbnN0cnVjdGlv
biBhY2Nlc3MgZmF1bHQgb24gdW5tYXBwZWQgZ3Vlc3QgZmV0Y2gKPiAtIFNlcmlhbGl6ZSB2aXJ0
dWFsIGludGVycnVwdCBwZW5kaW5nIHN0YXRlIHVwZGF0ZXMgdXNpbmcgcmF3IHNwaW5sb2NrCj4g
LSBGaXggU3BlY3RyZS12MSBpbiB2ZWN0b3IgcmVnaXN0ZXIgYWNjZXNzIHZpYSBPTkVfUkVHCj4K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gQW51cCBQYXRlbCAoMSk6Cj4gICAgICAgUklTQy1WOiBLVk06IFppY2JvW218
enxwXSBibG9jayBzaXplcyBzaG91bGQgYmUgYWx3YXlzIHByZXNlbnQgaW4gT05FX1JFRwo+Cj4g
RHlsYW4uV3UgKDEpOgo+ICAgICAgIHJpc2N2OiBrdm06IFNraXAgVExCIGZsdXNoIHdoZW4gRy1z
dGFnZSBQVEUgYmVjb21lcyB2YWxpZCB3aXRoIFN2dnB0Ywo+Cj4gRmFuZ3l1IFl1ICgxKToKPiAg
ICAgICBSSVNDLVY6IEtWTTogQXZvaWQgcmVkdW5kYW50IHBhZ2UtdGFibGUgYWxsb2NhdGlvbnMg
aW4gaW9yZW1hcCB0b3B1cAo+Cj4gUWluZ3dlaSBIdSAoMSk6Cj4gICAgICAgUklTQy1WOiBLVk06
IEluamVjdCBpbnN0cnVjdGlvbiBhY2Nlc3MgZmF1bHQgb24gdW5tYXBwZWQgZ3Vlc3QgZmV0Y2gK
Pgo+IFNldW5nSnUgQ2hlb24gKDEpOgo+ICAgICAgIEtWTTogcmlzY3Y6IFNCSSBGV0ZUOiBBcHBs
eSBMT0NLIGZsYWcgb25seSBvbiBzdWNjZXNzZnVsIHNldAo+Cj4gU2hlbmd3ZW4gQ2hlbmcgKDEp
Ogo+ICAgICAgIEtWTTogcmlzY3Y6IFBNVTogQm91bmQgY291bnRlciBtYXNrIHNjYW4gdG8gQklU
U19QRVJfTE9ORwo+Cj4gWGllIEJvICgxKToKPiAgICAgICBSSVNDLVY6IEtWTTogU2VyaWFsaXpl
IHZpcnR1YWwgaW50ZXJydXB0IHBlbmRpbmcgc3RhdGUgdXBkYXRlcwo+Cj4gWm9uZ21pbiBaaG91
ICgxKToKPiAgICAgICBLVk06IHJpc2N2OiBGaXggU3BlY3RyZS12MSBpbiB2ZWN0b3IgcmVnaXN0
ZXIgYWNjZXNzCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgMTAgKysr
LS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgICB8IDM1ICsrKysrKysrKysr
KysrKystLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jICAgICAgICAgICB8ICA2ICsrKy0K
PiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgICAgICAgICAgICAgIHwgIDMgKy0KPiAgYXJjaC9yaXNj
di9rdm0vdmNwdS5jICAgICAgICAgICAgIHwgNjggKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jICAgICAgICB8IDE5ICsr
KysrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICB8IDQ2ICsrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgICAgICAg
ICB8ICA0ICstLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgICAgfCAgNiArKy0t
Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMgICAgICB8IDE0ICsrKysrKy0tCj4gIDEw
IGZpbGVzIGNoYW5nZWQsIDEzNyBpbnNlcnRpb25zKCspLCA3NCBkZWxldGlvbnMoLSkKPgoKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
