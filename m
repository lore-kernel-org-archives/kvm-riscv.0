Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2CBFC72DA
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 09:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDJk0QQ6/MYnFjs3nOjo31tBmiULreV6ExNq0kkiW5w=; b=dchgcjHM2uKjsR
	ZiM6SyNWf8mRATxe1D7gljh7oqpejNhoxpgDfk+vwboATmW/Hmv3q+99y/V8k00rc9jdomLJ5terN
	r8aPQAFxiKj/oby4azhg+ZUE2kTa/+LvT4OV+TaeSq04v0Oi2nEhSW2el/hoSJDJmbL6YFunN33F4
	gwezElEH3NK+ztA6TlcZdkYVh8WA6OALVaR+avkdbWrpNM0lOo7iDPCRwlHQk8HX8PQjKDKIAxRHG
	Ae+HFzL3Y5iNbWRfXnlSifPhz2mWbJROOAXx5U0vbtoeEhs3WSP6kKQkqHF8YiO8dOJh4GqRi3/SS
	SJsIA+BrRFYEQi6rjiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xoZ-000000013Xd-0Geu;
	Tue, 24 Mar 2026 09:12:43 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xoV-000000013VD-125m
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 09:12:40 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-41576c5c01cso609499fac.3
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Mar 2026 02:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774343558; cv=none;
        d=google.com; s=arc-20240605;
        b=TA6L+NrNA+rLSxsCo0UhXL7sDzJ9q0NJo+iaLXhqgzKll3osA8CzEHzDIfhCZjOhtm
         C3VjRzdL6DZ3v9moOCWGqVpBtr5htaov9btppDOD3rbLlYsoJ7Fw7nvBftMfBNlVRGLb
         TtItd5rMoQzezNCKlo6GvbQMFWaSkKNCv249dk8bI5CWHFimlvaouKU4GRyiY3A6RlKB
         Rz6CkcuHoT1gMTxm3RmDVHPDikTSzjw8ahoeY2eCzGbWJJvfZRYlNwbwG4/6ImP9rkGr
         TqhRS+2ERpuq+c3Kdj9hJCKlTkv8RZLGZtUBD2fRx2OgelHxntdv/gfBbzcqop6emFqP
         Qj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=po0GgTJdVB9QB9NPjwdcp7bWtiuP/AIBoTKiY3wESRA=;
        fh=Jh8C016kMk+gHdfTJoMgAbToRAErHcNRtX+poywbRI0=;
        b=K7GiFv8Acw8J2tKE22x0FyXcFUtqgOaicsLaIU2snKIi3MQjldlpHkkKycKDMt7fwt
         HFGTEVoHGB9IH6WyFPnRflKiypkSq9wnqNrizQ8WjAlxTm8PvFtPBk4Agh/xtrsFF+Jn
         apbQihjqEPrGszUt1bw2nNCnvQ5hD8HF/8h2Z+35dWv9FeCDtAJ2aBMscUsqLokK5mrY
         NIvZd027lS1Mf26ldWTZTtPxJyvYMhw6/r3zBhcM8GFstL5tq+YfqTXgm88ESRv5qVwp
         WA3RCq/hDhrJsM6TtkyRdvgolIoOxeCKYXGhvc2DYoDFbTviZLLcI6E247ka/vh0NvoG
         CTWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1774343558; x=1774948358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=po0GgTJdVB9QB9NPjwdcp7bWtiuP/AIBoTKiY3wESRA=;
        b=GkFws/fq7G9I4xguYKPh9caCi9Hs6ugU+dFDY95jgoqV2zjx3Jeipw0x5fi+Ean30C
         4cRhSkLi2z0DVjXH2/BVC+dF/t0JAh+uGfhI2IK+lu0JDAicJB6w+KwiDwtcTAQNjuvn
         ov32rdqBUj+kPTI+fZ0c4f2sQzYZYdvhCNPmQIGdUH+ARakzxJVwk9VVxIflGjssC41M
         GKmqcJRvk0qMWv7HcD8512EGqe6I+55pxgjDtumkVyavM1JyIzBzt5/s7GryfRRBweY1
         5EzVyxz2K798iJDMSOySRRmHBsB6/GvEJhbqe+uWv+SfUDcvMr/MNeVfVWaqZxq28oRR
         218g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343558; x=1774948358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=po0GgTJdVB9QB9NPjwdcp7bWtiuP/AIBoTKiY3wESRA=;
        b=Ow26dIrjYPfntuStnDgevklqo5ZUqPU9EbcHxUwui9llogrQCDlwUP6f/gvsdWP3RT
         xTWinIjG1FSsIF6ex4X6pvaLBtGqLsNwbrWkOYiKJ01mrti3OnNUIPR+VrrfVDWSvnax
         c+qgHGDCsQ67Sc7dawUqjKGagJGQ9lylk74vq/EtsjMwWtrfkGLabQNJzhlezX/i1KE6
         0fE5773jQSu53wPDcIpmTBIPqHTQ2IVPtnSPAfU6tVAMTIHrpv8cPRfQiFzXjvF2dnAZ
         Y93AALje2O0c33oRd4Svu9llnmZzbzkdamvhOLiABk9HSRWbtoWC8/ELQvYqE/HLZY3T
         rsSg==
X-Forwarded-Encrypted: i=1; AJvYcCVdlOrKQZOr+Ovbo3ky6bu5caJvuAoOhBzduNZVqi2svtp24cx9ZHRPipNs7+W2jm5OtNUXcHsN5ZY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn6pVqiFTFL7IAcs60opq3BBVPCxoeR83F4COcD/xDTNHkrsR+
	jNLdpvlSmbz/KXrPCb0xUVAuiVpYu4Rdc9ETm5jGfJMYrWnXmxdBxupG+K2uum5X3Iu+WUYFtpo
	VE+A75nHco+3piFJMESu8x+XLwX9HHCCYt/LkswRDMA==
X-Gm-Gg: ATEYQzzpsnESgkP3dQecpO6eUhyw21nBcdQl6EafSvKhhnUnX1emZdIJQdMFnRJ9opf
	11MSLgMJxV7a8Lh3KpqLRs7Q51KqIb+PSPQZXNx5Br/mfqGhhTtFZXzG3hScHHm+kFht5+GmbmD
	rpmvv2Xzo0pWpJvBf5fLVtAlroUR8dPV5PYwApLunU0uD+K1Z7Vv75u15HLa3P0A+Bwn+Sjnesa
	mZhE9TSCpSFINxzEPCTXRiRGKaI4EpVEjNJPFArfZc9xU7ICNGkVOZsx8WMW5/FgjoEkw8wdetL
	KjANomE4WQ==
X-Received: by 2002:a05:6870:e8d:b0:404:1250:1c1f with SMTP id
 586e51a60fabf-41c10f8df08mr9671520fac.5.1774343557584; Tue, 24 Mar 2026
 02:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250920203851.2205115-28-ajones@ventanamicro.com>
 <20250922184336.GD1391379@nvidia.com> <20250922-50372a07397db3155fec49c9@orel>
 <20250922235651.GG1391379@nvidia.com> <87ecrx4guz.ffs@tglx>
 <20250923140646.GM1391379@nvidia.com> <20250923-b85e3309c54eaff1cdfddcf9@orel>
 <20250923152702.GB2608121@nvidia.com> <20250923-e459316700c55d661c060b08@orel>
 <20250923162302.GC2608121@nvidia.com> <20250923-b2caf55f4f87f05aaa619e0b@orel>
In-Reply-To: <20250923-b2caf55f4f87f05aaa619e0b@orel>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue, 24 Mar 2026 17:12:26 +0800
X-Gm-Features: AaiRm51YfU_yNPx_PEn26PHbdMYezrFLe21xvA7oPwXPoXNN6d2xjsb4N-4LCyk
Message-ID: <CABvJ_xjnVJjV2GnYr=1WuXqo9VivNXniq8BJ39LQNwaT6vUiQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 08/18] iommu/riscv: Use MSI table to enable IMSIC access
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_021239_315204_0047A085 
X-CRM114-Status: GOOD (  34.51  )
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

T24gV2VkLCBTZXAgMjQsIDIwMjUgYXQgMTI6MzTigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgU2VwIDIzLCAyMDI1IGF0IDAxOjIz
OjAyUE0gLTAzMDAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDIzLCAy
MDI1IGF0IDEwOjUwOjU2QU0gLTA1MDAsIEFuZHJldyBKb25lcyB3cm90ZToKPiA+ID4gWWVzLCB0
aGlzIGlzIHRoZSBwYXJ0IHRoYXQgSSdkIGxpa2UgdG8gbGVhbiBvbiB5b3UgZm9yLCBzaW5jZSBJ
IHVuZGVyc3RhbmQKPiA+ID4gd2Ugd2FudCB0byBhdm9pZCB0b28gbXVjaCBLVk0vdmlydCBzcGVj
aWFsIGNhc2luZyBmb3IgVkZJTy9JT01NVUZELiBJIHdhcwo+ID4gPiB0aGlua2luZyB0aGF0IGlm
IEkgYml0IHRoZSBidWxsZXQgYW5kIGltcGxlbWVudGVkIG5lc3RlZCBzdXBwb3J0IHRoYW4gd2hl
bgo+ID4gPiBuZXN0aW5nIHdhcyBzZWxlY3RlZCBpdCB3b3VsZCBiZSBhcHBhcmVudCB3ZSdyZSBp
biB2aXJ0IGNvbnRleHQuIEhvd2V2ZXIsCj4gPiA+IEkgd2FzIGhvcGluZyB0byBwdWxsIHRvZ2V0
aGVyIGEgc29sdXRpb24gdGhhdCB3b3JrcyB3aXRoIGN1cnJlbnQgUUVNVSBhbmQKPiA+ID4gVkZJ
TyB0b28uCj4gPgo+ID4gWW91IHByb2JhYmx5IGRvIGhhdmUgdG8gbWFrZSBuZXN0ZWQgcGFydCBv
ZiB0aGlzLCBidXQgSSBkb24ndCBoYXZlIGEKPiA+IGNsZWFyIHBpY3R1cmUgaG93IHlvdSdkIHRp
ZSBhbGwgdGhlIHBhcnRzIHRvZ2V0aGVyIHRocm91Z2ggdGhlIG5lc3RlZAo+ID4gQVBJLi4KPiA+
Cj4gPiBTb21laG93IHlvdSBoYXZlIHRvIGxvYWQgYSBtc2lwdHAgdGhhdCBpcyBlZmZlY3RpdmVs
eSBsaW5rZWQgdG8gdGhlCj4gPiBLVk0gcmVsaWFibHkgaW50byB0aGUgREMgZm9yIHRoZSBpb21t
dWZkIGNvbnRyb2xsZWQgZGV2aWNlcyB0aGF0IGFyZQo+ID4gbGlua2VkIHRvIHRoYXQgS1ZNLiBU
aGVuIHN5bmNocm9uaXplIHdpdGggVkZJTyB0aGF0IHRoaXMgaXMgZG9uZSBhbmQKPiA+IGl0IGNh
biBzZXR1cCBLVk0gb25seSBpbnRlcnJ1cHRzIHNvbWVob3cuIFRoaXMga3ZtIGVudGFuZ2xlbWVu
dCBpcyB0aGUKPiA+ICJ2aXJ0IiB5b3UgaGF2ZSBtZW50aW9uZWQgbWFueSB0aW1lcy4KPgo+IFll
cywgdGhlIFZGSU8rS1ZNIGlycWJ5cGFzcyBmcmFtZXdvcmsgY3VycmVudGx5IHByb3ZpZGVzIG11
Y2ggb2YgdGhpcwo+IHN1cHBvcnQgKHdoaWNoIHBhdGNoZXMgMTAtMTcgb2YgdGhpcyBzZXJpZXMg
bGV2ZXJhZ2UpLiBCdXQsIGlmIHVzaW5nCj4gbmVzdGVkIGlzIG5lY2Vzc2FyeSBpbiBvcmRlciB0
byAic2lnbmFsIiB0byB0aGUgcmVsZXZhbnQgc3Vic3lzdGVtcyB0aGF0Cj4gdGhlIGRldmljZSdz
IGlycXMgd2lsbCB0cnVseSBiZSBpc29sYXRlZCwgdGhlbiBJJ2xsIG5lZWQgdG8gc3RhcnQgZmln
dXJpbmcKPiBvdXQgaG93IGlvbW11ZmQgY2FuIGZpdCBpbnRvIHRoZSBtaXggKG9yIGlmIHdlJ2xs
IG5lZWQgYW4gaW9tbXVmZC1zcGVjaWZpYwo+IGltcGxlbWVudGF0aW9uIGZvciBhIG5ldyBtaXgp
Lgo+CgpIaSBBbmRyZXcgYW5kIEphc29uLAoKSSBqdXN0IG5vdGljZWQgdGhpcyB0aHJlYWQsIHNv
IGFwb2xvZ2llcyBpZiBJIG1pc3NlZCBhbnkgcHJpb3IgY29udGV4dApvciBpZiB0aGlzIGhhcyBh
bHJlYWR5IGJlZW4gZGlzY3Vzc2VkLgoKSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgdGhlIGN1
cnJlbnQgZGlzY3Vzc2lvbiByZXZvbHZlcyBhcm91bmQKdXNpbmcgbmVzdGVkIHRyYW5zbGF0aW9u
IHRvIGlkZW50aWZ5IGEgc2FmZSAiVmlydCBDb250ZXh0IiBmb3IgVkZJTywKbGFyZ2VseSBiZWNh
dXNlIHRoZSBiYXNlIFJJU0MtViBJT01NVS9JTVNJQyBkb2Vzbid0IHZhbGlkYXRlIE1TSSBkYXRh
LApsZWF2aW5nIG5vbi12aXJ0IGNhc2VzIHZ1bG5lcmFibGUgdG8gTVNJIHNwb29maW5nLgoKSSdk
IGxpa2UgdG8gc2hhcmUgYW4gYWx0ZXJuYXRpdmUgaWRlYSBhbmQgc2VlIGlmIGl0IG1pZ2h0IGJl
IGEgdmlhYmxlCmRpcmVjdGlvbiBmb3IgdGhpcyBzY2VuYXJpby4KCkFzIEFuZHJldyBtZW50aW9u
ZWQsIHNoYXJpbmcgdGhlIHNhbWUgSU1TSUMgZmlsZSB3aXRob3V0IGRhdGEKdmFsaWRhdGlvbiBt
YWtlcyBpdCBkaWZmaWN1bHQgdG8gcHJldmVudCBzcG9vZmluZy4gSG93ZXZlciwgd2hhdCBpZiB3
ZQpjb25zaWRlciB1dGlsaXppbmcgdGhlIE1SSUYgKE1lc3NhZ2UgUmVxdWVzdCBJbnRlcmZhY2Ug
RmlsZSkgZmVhdHVyZQpmb3IgVkZJTyBwYXNzdGhyb3VnaCBkZXZpY2VzPwoKV2hpbGUgTVJJRiBp
cyBwcmltYXJpbHkgZGVzaWduZWQgdG8gZXh0ZW5kIHRoZSBudW1iZXIgb2YgZ3Vlc3QgSU1TSUNz
LAp0aGUgc3BlY2lmaWNhdGlvbiBkb2Vzbid0IHNlZW0gdG8gbGltaXQgaXRzIHVzYWdlIHN0cmlj
dGx5IHRvIHRoZSBWaXJ0CkNvbnRleHQuIElmIHdlIGFzc2lnbiBhIGRlZGljYXRlZCBNUklGIHRv
IGEgcGFzc3Rocm91Z2ggZGV2aWNlIChldmVuCmZvciBub24tdmlydC91c2Vyc3BhY2UgY2FzZXMp
LCB0aGUgZGV2aWNlIHdvdWxkIG9ubHkgYmUgYWJsZSB0byBzZW5kCk1TSXMgdG8gaXRzIG93biBp
c29sYXRlZCBNUklGIHZpYSB0aGUgSU9NTVUgTVNJIHRhYmxlLgoKSW4gdGhpcyBzZXR1cCwgdGhl
IGFjdHVhbCBpbnRlcnJ1cHQgZGVsaXZlcmVkIHRvIHRoZSBwaHlzaWNhbCBDUFUKd291bGQgYmUg
dGhlIE5vdGljZSBNU0kgZ2VuZXJhdGVkIGJ5IHRoZSBJT01NVSBoYXJkd2FyZSBpdHNlbGYuIFNp
bmNlCnRoZSBhZGRyZXNzIGFuZCBkYXRhIG9mIHRoaXMgTm90aWNlIE1TSSBhcmUgc3RyaWN0bHkg
Y29uZmlndXJlZCBieSB0aGUKSG9zdCBPUywgdGhlIGRldmljZSB3b3VsZG4ndCBiZSBhYmxlIHRv
IHNwb29mIE1TSXMgdG8gdGhlIEhvc3Qgb3IKb3RoZXIgZGV2aWNlcy4KCklmIG15IHVuZGVyc3Rh
bmRpbmcgaXMgY29ycmVjdCwgdGhpcyBhcHByb2FjaCBtaWdodCBuYXR1cmFsbHkgcHJvdmlkZQp0
aGUgaXNvbGF0aW9uIG5lZWRlZCBmb3IgSVJRX0RPTUFJTl9GTEFHX0lTT0xBVEVEX01TSSBhY3Jv
c3MgYm90aCB2aXJ0CmFuZCBub24tdmlydCBjb250ZXh0cywgcG90ZW50aWFsbHkgc2ltcGxpZnlp
bmcgdGhlIG5lZWQgZm9yIEtWTS9WRklPCnNwZWNpYWwgY2FzaW5nLgoKSSB3b25kZXIgaWYgdGhp
cyBhcHByb2FjaCB3b3VsZCBiZSBhY2NlcHRhYmxlLCBvciBpZiB0aGVyZSBhcmUgYW55CmhhcmR3
YXJlL3NvZnR3YXJlIGNvbnN0cmFpbnRzIEkgbWlnaHQgaGF2ZSBvdmVybG9va2VkPwoKPiA+Cj4g
PiBUaGUgZGlyZWN0IGluamVjdGlvbiBpbnRlcnJ1cHQgcGF0aCBpcyBhbHJlYWR5IHF1aXRlIGEg
Y29uZnVzaW5nCj4gPiB0aGluZy4uCj4KPiBObyBhcmd1bWVudCB0aGVyZSA6LSkKPgo+IFRoYW5r
cywKPiBkcmV3Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
