Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8181DCD8CA4
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vz31GmHfz81wkjQgi+I1cJ8xTjI8HEahAkGTRn65ZgE=; b=skQZcbZapG1fZZ
	JrL2HaVZ07XyeOr4j9QtRu1aFo9ai5OJkdhMCYdAoHPTS1PBXWAU/EVA5myY93UYxqJJxLNR289wk
	rjNKHgq0F+jTW2/63k5InvYdZxVpIYs6yPCJ3Qb/fTl3zTnQdjfyavkAb/nJuHb7pArI7wPVm4ZAR
	mixgQkIxUroEJAqI4Adlz5GX9scMGWFWxH0CzdU/qvuSqKVmvyb1NQbY9GHcBc+U1aujw5MMv8EZx
	fH3cg1Ffo/VKNo/dDjVvzHYK1Cn6lS2w+mSFeP2wOuuBye/w+0JNBnmvMMRksoK7Tue9NOJQfkQI0
	b/+NamYxeEW2oy5WzOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeFx-00000004Eln-0uiq;
	Mon, 08 Jun 2026 17:59:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeFt-00000004ElK-2Ja9
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 17:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780941559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8d2xpklGhwQZIXzXL6uTt/rbyfEnaEp9dTHG5HoHQ0=;
	b=efCYMawm4kxlvgDS9yRKiiJmt0oecds8TNjEIgubIchTVPIM5Ai+CewaJ4IzoZOcwR/pqv
	LRCS9K01qODOKe2hx6ARCEklrNWjsPlErTNcZzoZ1P5bzvIfg8tvXmZBAodc0M6J4thCYN
	tcd/HsgDkDTr5nJeauaaMP4znfSV6wI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-xESSu0X1OLeYiAP_G9qajQ-1; Mon, 08 Jun 2026 13:59:16 -0400
X-MC-Unique: xESSu0X1OLeYiAP_G9qajQ-1
X-Mimecast-MFC-AGG-ID: xESSu0X1OLeYiAP_G9qajQ_1780941555
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-45ef616db45so3727241f8f.2
        for <kvm-riscv@lists.infradead.org>; Mon, 08 Jun 2026 10:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941555; x=1781546355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8d2xpklGhwQZIXzXL6uTt/rbyfEnaEp9dTHG5HoHQ0=;
        b=JkEM6PA1Z+3ZEtJj9IJiY1x/9XfWUju9qK7YCMgSla/5DV3CrHv/R8zKFd0ppsmtfw
         zITS11UbWWFq8L6R95c+p+NAFLX4crEcF4vSYYAspP7ug6+baM0UoGGVTVBnleOTIm4H
         5eBCyGctgfXJrpztyC4eS57sMiFwlOj1VTgBtiemxRinmOf0Q0D8ZHv35Ukj2AlTMzTY
         9LdhWb8wJI4m2syTwPtW/SCK/XCGIjhvq8OoBsZVgSYl2sLOdaQbz9Rv1eMq9ieGLYAB
         VQiPWIAEkjvHJg7nKeYNcOTdX5dHAvzEKdbKXaj6RW3lKzxm7VvacVm7gqo27bPVRDfR
         BPPA==
X-Forwarded-Encrypted: i=1; AFNElJ+BS03j1BqW4AtjlDTypo2mAc3ey9TgFFOV6cykPYVFaPQDHFlcNLWTddQ5APaOwv8Uuy1CbMRC8Mk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNhEJESVGo29ok2xeU0ycxWl4yBw6Ngyi8OY5XsuoCwaWZ5HsZ
	duaQpld5m3YVxpzXELQ6RE0pMidixVj5xcYooQV1Trqs/+gL8DAnX9KKXVv1m3gBMN7d/v1Yha1
	HB5b9P8wp6TPSVq3KDvevRhCtxtX7EefkgO+Yn6bqIPJ8SrAAo4IV1O9Y5BmN+6AFdSjL2PSQHS
	Q6a9fHoKGKJQeohGjKkcwUl5tbbr84YcZxluPF5484PQ==
X-Gm-Gg: Acq92OEzyjugM6kFe4oLV67cn7xzIU68XIB3SPqPgbszq5Pvxiig7J7dJtVfEawPfc5
	0NUe3OHmZUvo25q+rBWlj2g0SSgGM9+orMIyZtTK5Y+gh4yg4SI2gWdrV1ZrMWFgUB8E3TzPj7V
	NJQ+kHNCwQ0S7uVsVOez8Cn6bhH6GUjEcqVkKUz+T84yfX7XNDTPoadDgfnfy3mM5FrcVsuKBzj
	peLjkqjdMueSZwnuh2rKrf9uaj5lsR11aho4Qnmw8fagpfVjxJ6lRHFgDcyOYaRtrv+7JepXWmO
	yy4m0UW9wKBBl+By
X-Received: by 2002:a05:600c:1908:b0:490:b5d0:598f with SMTP id 5b1f17b1804b1-490c25b5f6cmr285228335e9.13.1780941555114;
        Mon, 08 Jun 2026 10:59:15 -0700 (PDT)
X-Received: by 2002:a05:600c:1908:b0:490:b5d0:598f with SMTP id
 5b1f17b1804b1-490c25b5f6cmr285227865e9.13.1780941554714; Mon, 08 Jun 2026
 10:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260608144252.351443-1-joro@8bytes.org> <20260608144252.351443-36-joro@8bytes.org>
 <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com> <aib8n5lO6HKbLC4Y@8bytes.org>
In-Reply-To: <aib8n5lO6HKbLC4Y@8bytes.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 8 Jun 2026 19:58:43 +0200
X-Gm-Features: AVVi8CcaSI98hh9wFoB_n6cKHV5EHNPF6kPS5m5gs3YdhiTjEhtRfK4vGBfAwzg
Message-ID: <CABgObfbUsDeStnZF-7oyR-W-Bvd4qTMoeUwGizgn10UTdKtZ2A@mail.gmail.com>
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: Sean Christopherson <seanjc@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com, 
	michael.roth@amd.com, nsaenz@amazon.com, anelkz@amazon.de, 
	James.Bottomley@hansenpartnership.com, Melody Wang <huibo.wang@amd.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, x86@kernel.org, 
	coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zKAR6KvvvxCu5HncFksEPiDhCi8n2z1MH_4hIy3W3rI_1780941555
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_105921_663554_617BC1CE 
X-CRM114-Status: GOOD (  21.95  )
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

T24gTW9uLCBKdW4gOCwgMjAyNiBhdCA3OjUy4oCvUE0gSsO2cmcgUsO2ZGVsIDxqb3JvQDhieXRl
cy5vcmc+IHdyb3RlOgo+IE9uIE1vbiwgSnVuIDA4LCAyMDI2IGF0IDA2OjQ3OjU0UE0gKzAyMDAs
IFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gPiBPbiA2LzgvMjYgMTY6NDIsIErDtnJnIFLDtmRlbCB3
cm90ZToKPiA+ID4gVGhlIGFsZ29yaXRobSBpcyB0byBhbHdheXMgcnVuIHRoZSBsb3dlc3QgcnVu
bmFibGUgcGxhbmUuIFBsYW5lCj4gPiA+IHN3aXRjaGVzIGFyZSBkb25lIGJ5IHN0b3BwaW5nIHRo
ZSBjdXJyZW50IHBsYW5lIGFuZCBzZXR0aW5nIGFub3RoZXIKPiA+ID4gcnVubmFibGUuCj4gPgo+
ID4gVGhpcyB3YXMgbGVmdCBhcmJpdHJhcnkgaW4gbXkgdmVyc2lvbiBiZWNhdXNlIGZvciBleGFt
cGxlIEh5cGVyLVYgVlRMcyB1c2UKPiA+IGhpZ2hlc3QtcnVubmFibGUgaW5zdGVhZC4gIEl0IGFs
c28gbWFkZSBwdXJlIHVzZXJzcGFjZSBzY2hlZHVsaW5nIHBvc3NpYmxlLAo+ID4gdGhvdWdoIHRo
YXQgbWF5IG5vdCBiZSB2ZXJ5IGltcG9ydGFudCBpbiB0aGUgZ3JhbmQgc2NoZW1lIG9mIHRoaW5n
cy4KPgo+IElJUkMgd2hhdCBIeXBlci1WIGRvZXMgaXMgYWx3YXlzIHRoZSBydW4gdGhlIGhpZ2hl
c3QtcHJpdmlsZWdlZCBydW5uYWJsZSBsZXZlbCwKPiBubz8gIE1heWJlIGluIHRoZWlyIG51bWJl
cmluZyBsZXZlbCAwIGhhcyB0aGUgbGVhc3QgcHJpdmlsZWdlcz8KClllcywgZXhhY3RseS4KCj4g
QW55d2F5LCBJIGFtIGhhcHB5IHRvIG1ha2UgY2hhbmdlcyBoZXJlLCBhbHNvIGJhc2VkIG9uIGlu
cHV0IGZyb20gdGhlIFZTTSBzaWRlLgoKUmVsYXRlZCB0byB0aGlzLCBsZXQgbWUga25vdyBpZiB5
b3Ugd2FudCBtZSB0byBwaWNrIHVwIGFnYWluIHRoZQpjb21tb24gcGFydCwgZXNwZWNpYWxseSB3
aXRoIFNhc2hpa28gYmVpbmcgaGFyZCBhdCB3b3JrIG9uIGl0LgoKPiA+IERpZCB5b3UgZHJvcCBp
dCBiZWNhdXNlIGl0IGRpZG4ndCB3b3JrLCBvciBqdXN0IGZvciBzaW1wbGljaXR5Pwo+Cj4gVGhl
IHVzZXItc3BhY2Ugc2NoZWR1bGluZyB3b3JrZWQsIG15IDYuMTcgcGxhbmVzIGltcGxlbWVudGF0
aW9uIHVzZWQgaXQuIEJ1dAo+IHRoZXJlIGFyZSBzb21lIHByb2JsZW1zIHdpdGggaXQgZ29pbmcg
Zm9yd2FyZCwgYmVjYXVzZSBURFggUGFydGl0aW9uaW5nIChhbmQKPiBsaWtlbHkgQVJNIENDQSBQ
bGFuZXMgYXMgd2VsbCkgZG8gbm90IGFsbG93IGFyYml0cmFyeSBzd2l0Y2hlcyBmb3JjZWQgYnkg
dGhlCj4gaHlwZXJ2aXNvci4gQWxsIHRoZXkgYWxsb3cgaXMgYSBmb3JjZWQgc3dpdGNoIHRvIHRo
ZSBoaWdoZXN0IHByaXZpbGVnZWQgcGxhbmUsCj4gdGhlIFNWU00gb24gU05QIHdpbGwgZm9yY2Ug
dGhlIHNhbWUgY29uc3RyYWludHMgYnkgbWFraW5nIGxvd2VyLXByaXZpbGVnZSBWTVNBcwo+IG5v
dC1ydW5uYWJsZSB3aGVuIGl0IGV4ZWN1dGVzLgoKVGhlIGlkZWEgb2YgdGhlIHVzZXJzcGFjZSBz
Y2hlZHVsaW5nIHdhcyB0aGF0IHlvdSdyZSBub3QgZm9yY2VkIHRvIHVzZQppdCAtIHRoZSBrZXJu
ZWwgY2FuIGFsd2F5cyBjaG9vc2UgdG8gb3ZlcnJpZGUgaXQgaWYgaXQncyB1c2luZyBhbgphY2Nl
bGVyYXRlZCBpbXBsZW1lbnRhdGlvbiBvZiBwbGFuZXMgKGFuZCBvZiBwbGFuZSBzd2l0Y2hpbmcp
LiBCdXQgaXQKYWxzbyBsZWF2ZXMgc29tZSBsZWV3YXkgdG8gZGlmZmVyZW50IGFjY2VsZXJhdGVk
IGltcGxlbWVudGF0aW9ucywgZWFjaApvZiB3aGljaCBjYW4gcGljayB0aGVpciBvd24gYWxnb3Jp
dGhtLgoKQ29uY2VwdHVhbGx5IEknZCByYXRoZXIga2VlcCB0aGUgcG9zc2liaWxpdHkgb2YgdXNl
cnNwYWNlIHNjaGVkdWxpbmcuCkJ1dCBtYXliZSBpdCBkb2Vzbid0IGFkZCBtdWNoLgoKUGFvbG8K
Cj4gU28gZXhwb3NpbmcgYW4gaW50ZXJmYWNlIGZvciB1c2VyLXNwYWNlIHRvIGNob3NlIHdoaWNo
IHBsYW5lIHRvIHJ1biBkb2VzIHNlZW0KPiB0byBnYWluIHNvbWUgd2VpcmQsIHBsYXRmb3JtIGRl
cGVuZGVudCBzZW1hbnRpY3MgZ29pbmcgZm9yd2FyZC4gVERYIGFuZCBDQ0EKPiBhbHNvIHJlcXVp
cmUgaW4ta2VybmVsIHN3aXRjaGluZyBhcyB0aGV5IGNhbiBzd2l0Y2ggcGxhbmVzIHdpdGhvdXQg
YSBWTUVYSVQsIHNvCj4gSSBkZWNpZGVkIHRvIGhhdmUgaXQgZnJvbSB0aGUgc3RhcnQuCj4KPgo+
IC1Kb2VyZwo+CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9r
dm0tcmlzY3YK
