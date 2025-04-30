Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875DDC369DC
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 13:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vCH4Vnh72nEQTRqxcBItRaqhCM8I6sd206V6QacYDoM=; b=oxKSMiRKCY1woo
	QcDIUAtqaLoTSeKIgFLmj22sfkb5t9ZYZUbcMQgctR0XJ9+LU2lAEDTDsLULimuNe6UkeD6vJ2gdD
	rXkXk2w0VJgXx3n5Oep14gv69y87JFaDUpnZybK1VEnZh/TFAPFroVT+vMc4TK2MyHtnQbHM3mYTq
	RmJBP3cCMqcXzzAf7EL231MHMt6n73R61EdTp+cTnfOMXPDRgTxY3tuT8qwPP5JRrQFY8zMukwbF6
	PUD/yyU1Dc8ET0zbxc3LznZp1+Ik+TcjBhi8gPsuOj54JJBqNDn8+0BTNq7OPRbyVquSPO/vbQKIP
	PfTg+UyLpmQkB6ycqT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA75a-0000000CvAc-0Elp;
	Wed, 30 Apr 2025 13:03:02 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA75H-0000000Cv7v-3nd9
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 13:02:45 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3d96d16b375so787425ab.1
        for <kvm-riscv@lists.infradead.org>; Wed, 30 Apr 2025 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746018162; x=1746622962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vp0okNAQhGtn3j89G0GTNiN0i7XN6OEtooLucIvK78M=;
        b=NUwgFXSkO5XXyyIHsVbmXsjqfqQRdqbKhpiKnmqx4nLuLYRBUhP1Wo5zN18/vmTODm
         D26nSopBPicaL8OMMle5nON0SZgitORPgvqltGd6+a7G60JQ4iEL4jPbzy9rVs/Iy77Q
         92f0Yy7lUU2fGLGRPrSXVmpWIzPR2D7bNHdzX7QP9HMtnz8Cff3C7LrUcIh05k7/rAF3
         BVHwbwLrYz/rDJDXM5OxLF4nY3oa/4R5Zi0dj/9anvWyF7L8zWyMZ2JGPUJAAjxGTEpV
         ugo8W+5tTwqlLHNJOeV9P4bNEQeguuZkNXIPSKa+FBZ6F8zGzvK6wcsvWbP6HF3U6NMM
         IK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018162; x=1746622962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vp0okNAQhGtn3j89G0GTNiN0i7XN6OEtooLucIvK78M=;
        b=MFGcSVly+6wJ5QF5iJ2mrxctJTejmmtBobUuy2b55nLJxk1RRX7HfqAQwKGZJ1OOY0
         d2GXNA97dpLAhibcpxvtxZXyGiK2ypuANaowF7EFcYjhJ6nnC7mV3+bMGsGAuXVyjx1F
         ueMSYwnXlgmmdOwWzU0FlnKgYh90egi4Th6hOw7FXaCAU7Oast3eRaXrN6xqGi3vMrPA
         QaBJHEHov7J1D3IRKxG/jT1FbhNRYLvM53/BM0Ex4oJt/tjVXMj1cyI1d3dUDyPfGOGa
         Bp0XDja1JPQ3avUsg8iUGQ30dTr81ms4YqeFQYjgmh9KmCyMlOWTmV1d8JeGUK5aTSNJ
         zi2g==
X-Forwarded-Encrypted: i=1; AJvYcCVPGSI+IGgctYc8anGMnCLlWnq6Ig1x/AopSZ2KIFxDOa9kE2upeW7O/jNSyXgoalUrRkt5+w8bSMM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcmTeHIYxrPMUlLb9QDLjGq7y444faZGjpQwKfo5jhEjs95p41
	a3GurJCTLogyZ/rEK2PHulIC1h4Vq9llDivVRh6vILEINaNyRLPxjZ6pdR8Fa5y2djVqBws5GsG
	4NUzCbij8TAj+e1ZJVjaugmL12uuPAl0e/mhVkg==
X-Gm-Gg: ASbGncut8MID4jGaWI7WNj2DAwmlm9o/SjWjo3Foq+IO6zb41/YhNzUpS8p6LMY4WYz
	8rcAN6lIl82I+qKCN8hFFTlqOJySkak8aMqmEt4HIftkjIYPyqBbOL0ocEhwQzOV8tEEC5RmJ3m
	asJ5KRm6lRaSpCWC/JmlObUSo=
X-Google-Smtp-Source: AGHT+IFltNG5LrzMPCK7C6LDg14PO7W7coDdcuUm278zKD9SLwj77Gzwt4AG6zeQBZfmymsMU1N87BYFfyazgTLsFRc=
X-Received: by 2002:a05:6e02:188a:b0:3d8:975:b825 with SMTP id
 e9e14a558f8ab-3d967fa1b89mr21495005ab.5.1746018162237; Wed, 30 Apr 2025
 06:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com> <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com> <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
 <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com> <CAAhSdy01yBBfJwdTn90WeXFR85=1zTxuebFhi4CQJuOujVTHXg@mail.gmail.com>
 <D9J9DW53Q2GD.1PB647ISOCXRX@ventanamicro.com> <CAAhSdy0B-pF-jHmTXNYE7NXwdCWJepDtGR__S+P4MhZ1bfUERQ@mail.gmail.com>
 <CAAhSdy20pq3KvbCeST=h+O5PWfs2E4uXpX9BbbzE7GJzn+pzkA@mail.gmail.com>
 <D9JTZ6HH00KY.1B1SKH1Z0UI1S@ventanamicro.com> <CAAhSdy0TfpWQ-kC_gUUCU0oC5dR45A1v9q84H2Tj9A8kdO0d1A@mail.gmail.com>
 <D9JY52BJEFX2.2S5XL9NOOGBS7@ventanamicro.com>
In-Reply-To: <D9JY52BJEFX2.2S5XL9NOOGBS7@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 30 Apr 2025 18:32:31 +0530
X-Gm-Features: ATxdqUEFxpf2kco5RCzE6InKYF1PowLSM7jupULrAjdgxCDaTJf8QVEmoaCDMJQ
Message-ID: <CAAhSdy1xCRocu2uNri4iDm+NQd+VE8JRVeASfYJ8Qspr5aEz8g@mail.gmail.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming runnable
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_060243_936909_DA2FA35F 
X-CRM114-Status: GOOD (  32.90  )
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

T24gV2VkLCBBcHIgMzAsIDIwMjUgYXQgNToxNeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDQtMzBUMTU6NDc6MTMrMDU6MzAs
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ogo+ID4gT24gV2VkLCBBcHIgMzAsIDIw
MjUgYXQgMTo1OeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29t
PiB3cm90ZToKPiA+PiAyMDI1LTA0LTMwVDEwOjU2OjM1KzA1OjMwLCBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPjoKPiA+PiA+IE9uIFdlZCwgQXByIDMwLCAyMDI1IGF0IDk6NTLigK9B
TSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+PiA+PiBPbiBUdWUs
IEFwciAyOSwgMjAyNSBhdCA5OjUx4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+ID4+ID4+ID4gVGhlIHBvaW50IG9mIHRoaXMgcGF0Y2ggaXMg
dG8gcmVzZXQgdGhlIGJvb3QgVkNQVSwgc28gd2UgcmVzZXQgdGhlIFZDUFUKPiA+PiA+PiA+IHRo
YXQgaXMgbWFkZSBydW5uYWJsZSBieSB0aGUgS1ZNX1NFVF9NUF9TVEFURSBJT0NUTC4KPiA+PiA+
Pgo+ID4+ID4+IExpa2UgSSBzYWlkIGJlZm9yZSwgd2UgZG9uJ3QgbmVlZCB0byBkbyB0aGlzLiBU
aGUgaW5pdGlhdGluZyBWQ1BVCj4gPj4gPj4gY2FuIGJlIHJlc2V0dGVkIGp1c3QgYmVmb3JlIGV4
aXRpbmcgdG8gdXNlciBzcGFjZSBmb3Igc3lzdGVtIHJlc2V0Cj4gPj4gPj4gZXZlbnQgZXhpdC4K
PiA+Pgo+ID4+IFlvdSBhc3N1bWUgaW5pdGlhdGluZyBWQ1BVID09IGJvb3QgVkNQVS4KPiA+Pgo+
ID4+IFdlIHNob3VsZCBwcmV2ZW50IEtWTV9TRVRfTVBfU1RBVEUgSU9DVEwgZm9yIGFsbCBub24t
aW5pdGlhdGluZyBWQ1BVcyBpZgo+ID4+IHdlIGRlY2lkZSB0byBhY2NlcHQgdGhlIGFzc3VtcHRp
b24uCj4gPgo+ID4gVGhlcmUgaXMgbm8gc3VjaCBhc3N1bXB0aW9uLgo+Cj4gWW91IHByb2JhYmx5
IGhhdmVuJ3QgaW50ZW5kZWQgaXQ6Cj4KPiAgIDEpIFZDUFUgMCBpcyAiY2hpbGxpbmciIGluIHVz
ZXJzcGFjZS4KPiAgIDIpIFZDUFUgMSBpbml0aWF0ZXMgU0JJIHJlc2V0Lgo+ICAgMykgVkNQVSAx
IG1ha2VzIGEgcmVzZXQgcmVxdWVzdCB0byBWQ1BVIDAuCj4gICA0KSBWQ1BVIDEgcmV0dXJucyB0
byB1c2Vyc3BhY2UuCj4gICA1KSBVc2Vyc3BhY2Uga25vd3MgaXQgc2hvdWxkIHJlc2V0IHRoZSBW
TS4KPiAgIDYpIFZDUFUgMCBzdGlsbCBoYXNuJ3QgZW50ZXJlZCBLVk0uCj4gICA3KSBVc2Vyc3Bh
Y2Ugc2V0cyB0aGUgaW5pdGlhbCBzdGF0ZSBvZiBWQ1BVIDAgYW5kIGVudGVycyBLVk0uCj4gICA4
KSBWQ1BVIDAgaXMgcmVzZXQgaW4gS1ZNLCBiZWNhdXNlIG9mIHRoZSBwZW5kaW5nIHJlcXVlc3Qu
Cj4gICA5KSBUaGUgaW5pdGlhbCBib290IHN0YXRlIGZyb20gdXNlcnNwYWNlIGlzIGxvc3QuCj4K
PiA+PiBJJ2QgcmF0aGVyIGNob29zZSBhIGRpZmZlcmVudCBkZXNpZ24sIHRob3VnaC4KPiA+Pgo+
ID4+IEhvdyBhYm91dCBhIG5ldyB1c2Vyc3BhY2UgaW50ZXJmYWNlIGZvciBJT0NUTCByZXNldD8K
PiA+PiAoQ2FuIGJlIGNhcGFiaWxpdHkgdG9nZ2xlIGZvciBLVk1fU0VUX01QX1NUQVRFIG9yIGEg
c3RyYWlnaHQgbmV3IElPQ1RMLikKPiA+Pgo+ID4+IFRoYXQgd291bGRuJ3QgImZpeCIgY3VycmVu
dCB1c2Vyc3BhY2VzLCBidXQgd291bGQgc2lnbmlmaWNhbnRseSBpbXByb3ZlCj4gPj4gdGhlIHNh
bml0eSBvZiB0aGUgS1ZNIGludGVyZmFjZS4KPiA+Cj4gPiBJIGJlbGlldmUgdGhlIGN1cnJlbnQg
aW1wbGVtZW50YXRpb24gbmVlZHMgYSBmZXcgaW1wcm92ZW1lbnRzCj4gPiB0aGF0J3MgYWxsLiBX
ZSBjZXJ0YWlubHkgZG9uJ3QgbmVlZCB0byBpbnRyb2R1Y2UgYW55IG5ldyBJT0NUTC4KPgo+IEkg
ZG8gdG9vLiAgVGhlIHdob2xlIHBhdGNoIGNvdWxkIGhhdmUgYmVlbiBhIHNpbmdsZSBsaW5lOgo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHUuYwo+IGluZGV4IGQzZDk1N2E5ZTVjNC4uYjNlNmFkODdlMWNkIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC01
MTEsNiArNTExLDcgQEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X21wc3RhdGUoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LAo+Cj4gICAgICAgICBzd2l0Y2ggKG1wX3N0YXRlLT5tcF9zdGF0ZSkg
ewo+ICAgICAgICAgY2FzZSBLVk1fTVBfU1RBVEVfUlVOTkFCTEU6Cj4gKyAgICAgICAgICAgICAg
IGt2bV9yaXNjdl9yZXNldF92Y3B1KHZjcHUpOwo+ICAgICAgICAgICAgICAgICBXUklURV9PTkNF
KHZjcHUtPmFyY2gubXBfc3RhdGUsICptcF9zdGF0ZSk7Cj4gICAgICAgICAgICAgICAgIGJyZWFr
Owo+ICAgICAgICAgY2FzZSBLVk1fTVBfU1RBVEVfU1RPUFBFRDoKPgo+IEl0IGlzIHRoZSBiYWNr
d2FyZCBjb21wYXRpYmlsaXR5IGFuZCB0cnlpbmcgdG8gZml4IGN1cnJlbnQgdXNlcnNwYWNlcwo+
IHRoYXQncyBtYWtpbmcgaXQgdWdseS4gIEkgYWxyZWFkeSBnYXZlIHVwIG9uIHRoZSBsYXR0ZXIs
IHNvIHdlIGNhbiBoYXZlCj4gYSBkZWNlbnRseSBjbGVhbiBzb2x1dGlvbiB3aXRoIHRoZSBmb3Jt
ZXIuCj4KPiA+IEFsc28sIGtlZXAgaW4gbWluZCB0aGF0IHNvIGZhciB3ZSBoYXZlIGF2b2lkZWQg
YW55IFJJU0MtVgo+ID4gc3BlY2lmaWMgS1ZNIElPQ1RMcyBhbmQgd2Ugc2hvdWxkIHRyeSB0byBr
ZWVwIGl0IHRoYXQgd2F5Cj4gPiBhcyBsb25nIGFzIHdlIGNhbi4KPgo+IFdlIGNhbiByZS11c2Ug
S1ZNX1NFVF9NUF9TVEFURSBhbmQgYWRkIGEgS1ZNIGNhcGFiaWxpdHkuCj4gVXNlcnNwYWNlIHdp
bGwgb3B0LWluIHRvIHJlc2V0IHRoZSBWQ1BVIHRocm91Z2ggdGhlIGV4aXN0aW5nIElPQ1RMLgo+
Cj4gVGhpcyBkZXNpZ24gd2lsbCBhbHNvIGFsbG93IHVzZXJzcGFjZSB0byB0cmlnZ2VyIGEgVkNQ
VSByZXNldCB3aXRob3V0Cj4gdGVhcmluZyBkb3duIHRoZSB3aG9sZSBWTS4KCk9rYXksIGxldHMg
Z28gYWhlYWQgd2l0aCBhIEtWTSBjYXBhYmlsaXR5IHdoaWNoIHVzZXIgc3BhY2UgY2FuIG9wdC1p
bgpmb3IgS1ZNX1NFVF9NUF9TVEFURSBpb2N0bCgpLgoKS2VlcCBpbiBtaW5kIHRoYXQgYXQgcnVu
dGltZSBHdWVzdCBjYW4gc3RpbGwgZG8gQ1BVIGhvdHBsdWcgdXNpbmcgU0JJCkhTTSBzdGFydC9z
dG9wIGFuZCBkbyBzeXN0ZW0gc3VzcGVuZCB1c2luZyBTQkkgU1VTUCBzbyB3ZSBzaG91bGQKY29u
dGludWUgdG8gaGF2ZSBWQ1BVIHJlc2V0IHJlcXVlc3RzIGZvciBib3RoIHRoZXNlIFNCSSBleHRl
bnNpb25zLgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK
