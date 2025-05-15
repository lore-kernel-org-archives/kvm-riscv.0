Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF0BC2D0CB
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 May 2025 05:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9wI+TWU2u5t18ytiKpcz/jJJY3CJ0iO8JfkNi0Y9Lk=; b=rYVReC1SmErkS4
	pWtesERiTiyjZLiCa8UvScq8KdDVBbOvuZAyvGa0Oj+/yq13BdfjfuwqqMPWMmsKaWrVGn2xl07vC
	PsrSz7PZAAAnT4mdwBbyTxpgjTOk0cV8sPt1hKtJ52/ACIlh2we6//aReMsJ9KTGYGXqJgdfsDhVY
	VTtTzBDCmkCL/FxU09H8Vs7aQ7TtYQb8uK1LUl8FHWAM9+LiANqgOutX49YOFNhyG6HRbiLa0C7DB
	SXu+A4Ozym96ac8W0o0mKBNs6A1PZY/VRaZs48lsOxtIuxeGlfoL53SKzE1rK4NXsdVR+osrpp0Xm
	b1rqBY6lomujRzlzpfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRKt-0000000H4D0-3k10;
	Thu, 15 May 2025 05:40:51 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFRKq-0000000H4CB-1ALL
	for kvm-riscv@lists.infradead.org;
	Thu, 15 May 2025 05:40:50 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3d96d16b369so4656205ab.0
        for <kvm-riscv@lists.infradead.org>; Wed, 14 May 2025 22:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747287647; x=1747892447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz1T20yidSVCKk3JyCiwZoMyHHxlzlfZ7sxgHG4h3Ms=;
        b=SAxKMIqwnfRq26FOR33tzlMTmep8wzq1BVkofdT7WnMujF/Fxt+Xfx2BND/v20bdZu
         DY46QWqZm3vic6+3VhX5PFKyTiDO9tSbgloQrtjEstsgmAZAOpaxEd/2pUTJXxJ+DbFd
         0CUgDoCatZq6RLf/APr/TTX5NFKIsBgIxxrGgBfLSPYPmXStq1kWhxgF1LnOr3yzz8Zw
         y6JyMBrYALQRAKHUrte/HSI3KPXKduzz8boNXkFdZsS0v7Y4vgPIgVyRLXFadgZUTYh8
         a3APBSenr+zaDmRq9son3AGOEYmR8y7ZRAJ9Kg59I0neJk5XlzEqv2M2Ngcm8e/M2Jv0
         4sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747287647; x=1747892447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uz1T20yidSVCKk3JyCiwZoMyHHxlzlfZ7sxgHG4h3Ms=;
        b=Nsp5ANG6/7AOOdHVOeA581yGqwL2RxDi6x6RipmFcHR7FcGq4GrRDQPY7w18sxIOnz
         GH+ogZuB/2BsQC9PCyRtGVXEaq1rkLBYIH7eYAoNhZVCb2jp5D5VhzDHhfsCDzQgMTCC
         Fnr3eZokNmPzM/2SA53w4Mocha07EWUw3FgQ8EGibcI4Wd+kQM+n/87b/m3GiUZC0P6g
         QX9PgtukvMuySjttGj2Dvub/YC5+w/Vft3Z+di5T/e2UIXCRVgKYjbKYcSuPR6NIond8
         86z423NCtngeGHJKGnB39pyJbOHko7/OE+9Rna/zf3V6os7eThYRT/CridwcRuHPkbo2
         J9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGxlgUJJj2ayHwI214mAkn4CQ3+KBaSH9pc2hDwfx3jvkihlizIuUl/5Z3plLcddDz7hxyClOkqsk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvB9F7AKorUSuxM74r+X9LcmOACic7GjMqfPZeWr1EkNq0LARO
	HgKx1+tsLinZ5VfuVIrVj5bBFUnXEVLleJgit8OzEPxXSPqdt7DfhYhInqVkINdUZ7RtFiFloRh
	WDjRr+M1U7qby4+CkKvFYHKKwpQTU7V+fQz6xzg==
X-Gm-Gg: ASbGncsv701zUlTOkHjx2Pd2X+EelVH80VXgD1zOjJmflScgIXR3Ln2eyiH+8HrDRF6
	9v7e/6V/GIO3efXjg7Rl7UxIEZtZFdTmZVXvgK3GeHUoX5rf00aYpznp49fXpvP/Co+sz1nSNu2
	XI8aA5TaJ2FjBlccet15BiFP9mG2lKCCs=
X-Google-Smtp-Source: AGHT+IFTDygqebxFrfLhPNX+H4Kgt8uWXhKH50xWzqmnoJDcPg0UVlggjxomSWbuTCti64Fu8NXM5RNuQ470N3l+oyw=
X-Received: by 2002:a05:6e02:1fc6:b0:3d9:39f3:f250 with SMTP id
 e9e14a558f8ab-3db6f794c00mr72097505ab.3.1747287646677; Wed, 14 May 2025
 22:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com>
 <CAAhSdy2LbLwRxuFVtMrrcTTD5NCxVCGLy4o=ZUowxT_9DXGqBA@mail.gmail.com> <CAHBxVyHXJYDWbfY7FAEBB0S0ZG2+ka6KpWpd7+NO9jhApxav5g@mail.gmail.com>
In-Reply-To: <CAHBxVyHXJYDWbfY7FAEBB0S0ZG2+ka6KpWpd7+NO9jhApxav5g@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 May 2025 11:10:34 +0530
X-Gm-Features: AX0GCFvhFxNwn3sOoUM6uFOgfx0BZ3COs0Idy6xZaupJBYExW9VxrohdUkojQQE
Message-ID: <CAAhSdy2DG0y3r8T=AqJ-T7+VaVcVpY0pSRZDptfYwwknshB+zg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Disable instret/cycle for VU mode by default
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_224048_582107_A149045E 
X-CRM114-Status: GOOD (  21.87  )
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

T24gVGh1LCBNYXkgMTUsIDIwMjUgYXQgMjozMeKAr0FNIEF0aXNoIEt1bWFyIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDE0LCAyMDI1IGF0IDM6NTXi
gK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBX
ZWQsIE1heSAxNCwgMjAyNSBhdCAxMjoxM+KAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3Np
bmMuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhlIEtWTSB2aXJ0dWFsaXplcyBQTVUgaW4gUklT
Qy1WIGFuZCBkaXNhYmxlcyBhbGwgY291bnRlciBhY2Nlc3MgZXhjZXB0Cj4gPiA+IFRNIGJpdCBi
eSBkZWZhdWx0IHZpIGhzdGF0ZWVuIENTUi4gVGhlcmUgaXMgbm8gYmVuZWZpdCBpbiBlbmFibGlu
ZyBDWS9UTQo+ID4gPiBiaXRzIGluIHNjb3VudGVyZW4gZm9yIHRoZSBndWVzdCB1c2VyIHNwYWNl
IGFzIGl0IGNhbid0IGJlIHJ1biB3aXRob3V0Cj4gPiA+IGhjb3VudGVyZW4gYW55d2F5cy4KPiA+
ID4KPiA+ID4gQWxsb3cgb25seSBUTSBiaXQgd2hpY2ggbWF0Y2hlcyB0aGUgaGNvdW50ZXJlbiBk
ZWZhdWx0IHNldHRpbmcuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxh
dGlzaHBAcml2b3NpbmMuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUu
YyB8IDQgKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4gPiBpbmRleCA2MGQ2ODRjNzZjNTguLjg3MzU5M2Jm
ZTYxMCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gPiA+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4gPiBAQCAtMTQ2LDggKzE0Niw4IEBAIGludCBrdm1f
YXJjaF92Y3B1X2NyZWF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gPiA+ICAgICAgICAgaWYg
KGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHZjcHUsIGNudHgpKQo+ID4gPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiA+Cj4gPiA+IC0gICAgICAgLyogQnkg
ZGVmYXVsdCwgbWFrZSBDWSwgVE0sIGFuZCBJUiBjb3VudGVycyBhY2Nlc3NpYmxlIGluIFZVIG1v
ZGUgKi8KPiA+ID4gLSAgICAgICByZXNldF9jc3ItPnNjb3VudGVyZW4gPSAweDc7Cj4gPiA+ICsg
ICAgICAgLyogQnkgZGVmYXVsdCwgb25seSBUTSBzaG91bGQgYmUgYWNjZXNzaWJsZSBpbiBWVSBt
b2RlICovCj4gPiA+ICsgICAgICAgcmVzZXRfY3NyLT5zY291bnRlcmVuID0gMHgyOwo+ID4KPiA+
IExldCdzIHJlbW92ZSB0aGlzIGFzIHdlbGwgYmVjYXVzZSB0aGUgTGludXggU0JJIFBNVSBkcml2
ZXIKPiA+IGRvZXMgaW5pdGlhbGl6ZSBzY291bnRlcmVuIGNvcnJlY3RseS4KPiA+Cj4KPiBCdXQg
b3RoZXIgZ3Vlc3RzIG1heSBub3QuIEkgdGhvdWdodCB0aW1lIHNob3VsZCBiZSBhIGJhc2ljIG9u
ZSB0aGF0Cj4gc2hvdWxkIGJlIGFsbG93ZWQgYnkgZGVmYXVsdC4KPgoKVGhlcmUgaXMgbm8gc3Bl
Y2lmaWNhdGlvbiAoU0JJIG9yIFByaXYgc3BlYykgd2hpY2ggbWFuZGF0ZXMgTS1tb2RlCm9yIEhT
LW1vZGUgdG8gc2V0dXAgUy1tb2RlIENTUnMuIFNldHRpbmcgc2NvdW50ZXJlbiBiaXRzIChpbmNs
dWRpbmcKVE0gYml0KSBoYXMgYWx3YXlzIGJlZW4gYSBIQUNLIG9yIHdvcmstYXJvdW5kLgoKSXQg
aXMgYmV0dGVyIHRvIHJlbW92ZSBzY291bnRlcmVuIGluaXRpYWxpemF0aW9uIEhBQ0sgZnJvbSBL
Vk0gUklTQy1WCmJlZm9yZSBtb3JlIHN1cGVydmlzb3Igc29mdHdhcmUgc3RhcnRzIGRlcGVuZGlu
ZyBvbiBpdC4KClJlZ2FyZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
