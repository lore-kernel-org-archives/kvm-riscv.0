Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9843CCD343F
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 May 2026 12:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tS5TU0NRTWiAOqtW2Vi91hgxNX+hOq12E7lKPvOhToU=; b=a2BaJkjmSAfhV5
	dAFcZNqksl+HqEBOFuEv9NpwyTRVbR+xCUVLGAMupm9JuGdpKNtfKC1sOUMkCphjLL8CbIPF5v0mM
	SBqeJEDx1XpTaqRiWmWEYsvQo+NU5o4s31XjHRw1ZMrrE8VObbAoQMuIh3AQ0pBNth7noQ5qgx3mw
	dLoM28YwplhQMS+pBUNoKf4RhuqJWLbLLZAqcDrO4qgesrgt8V1m29tq1SpQ/VjyX1WXCrfEGoihy
	xORKlb+w4AyGmrLZTD5wPS6GIfJdNLG1VPQNabDJB2/orKS0Q1tbziW+9gVSumcOXSORK4u4/QhAM
	zwahKv4WG8ry3/jXkWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxQ9-00000003jIz-1N5F;
	Thu, 07 May 2026 12:01:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxQ7-00000003jII-2l6l
	for kvm-riscv@bombadil.infradead.org;
	Thu, 07 May 2026 12:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YnaYJ8w6kd34yqFksm5B7jTO172I6eMzgrwpvE9MTNs=; b=Yk29/PLqpPDbZSjo4XjmFSnknI
	8oifAl5AMhE3TjbIskqSJU96Aexmh3es8J9fdXsQ/oyJA5ojvk8+mytKfujyEG+EM7Asxfx50Ime+
	nuofk88rHwgV5kZTpO5D8aTLl3ngL77Ka98OCqsGx/96tYpVJXSGW2DJtODNlIf6Sxh1T80nxb1I1
	GomaFL3atBaBwSK+BqjBkSH/bgui3Nm3hlkofdDxxY2JfA+vfS9d96sb7QZHMuKugb4A0Dv0e4oAn
	O0u6xQaags8PW1klA6h3L70TI/Lcv6Li0gIxH9L7scpyuc4b5rEqh+BMD3hhU05edJzG6Z77UJeET
	D7zVoZUA==;
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxQ2-00000003QZT-3XIH
	for kvm-riscv@lists.infradead.org;
	Thu, 07 May 2026 12:01:34 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-697bcc9d769so430784eaf.0
        for <kvm-riscv@lists.infradead.org>; Thu, 07 May 2026 05:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778155288; cv=none;
        d=google.com; s=arc-20240605;
        b=W0zXNtmsPiEGJoOJA6KHTx02bPhQtuMO3pXARhwKuqhvNmVdb0OY06HSWhyYngHdTJ
         tQGSA++o8zQiEIeKa/XSO9BQZl35pLqyqJkFF+1Vh72VBrFoWNdRrN6E7Lsh1Kjiv7f7
         5RAaTf3j2FZI/ZVaRx5ehgTHGV/7x+Zr39j2rIh/ElE4LRCMANl4T8QOSNgklzOxImwc
         +PY7JfkgimzyhpjN+x+2sQ2DzsVzMC820mWgDkd3BJhUNCDqoGGS+xFtpt/4X3i26w+1
         XC4jkTLerhLUzIGhAcsed4SxWBGFyXc+pMOY5VgABTdfKfJqG+h/0MuwjhgmSPzn6uBS
         dR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YnaYJ8w6kd34yqFksm5B7jTO172I6eMzgrwpvE9MTNs=;
        fh=hF0NtCQEXMjiqZFbXw9armZsUJnJTgI3QQaB39RwZi4=;
        b=WZJeMuhwTOnJ6eSkbKbT8z8/FvisR4Fu9Bv+PLKxPGcduP+161nhwkJ2ut3a8HFldr
         OxyPWuoNGbxJG9AkHL78Pex76DHg0s+hOJ2MnSl+9bnLy53KLalKNzwEQ/wHzgoq/tw6
         9DPr2AcKVNsEPMADAc4Nrb0D9lSek6/PWhXQSXgPbBsCZ3BZnLtikQ218FNRPk/QtKkE
         b+YgR64njB8PqEWtEvKzbn703kULYMHqE3YXnKoygSsMUazM/1ZFgRG6RHfRRW5SSD+s
         3JmPs5XikBJy2FiL++GAy9muX7b6boN1H131zNDCERBZjlFkZhIP6V6igDYm5ZtHcf4D
         KAeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778155288; x=1778760088; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnaYJ8w6kd34yqFksm5B7jTO172I6eMzgrwpvE9MTNs=;
        b=qcu0EUXd7aVzYi9WVlFQUXmW0tRQiqmRLmHTpgcGd53KwMqWziprsLz3Aa7IZzJ912
         nXHoNFwZwKcwCfAZ6nb9g1KjSoCuQbOpkkOoeFfUkBkmBd3f5Ubx8cUmOcqxw3Y6HOmJ
         YZFp1Sc4xqbf593Bt+OV11NCX/7q4miuuv5VnFWolKZBjiVTUvs18vIkVOcOTpjWTtAS
         8DnUnXYkMRUvbWGMq2rNdHvKhNUBS9eWT2B3xHVa98Jfhbgyhesg31Uqk+PAqwudhl3x
         K4Apeu0sA1bpc81zCru7Q+oRKT/V4vywg0Y33TGmIpBxUvzkra2hweQ7JmtUBJ6UR1at
         C0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155288; x=1778760088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YnaYJ8w6kd34yqFksm5B7jTO172I6eMzgrwpvE9MTNs=;
        b=gFc+9wCHwNcJvh5Y9UeBq+czc5mWOWdG0Fc3vm7lMrRxHWf5fmnSRWzbMU332cbL3W
         ajzxwCmzdcS3/iM2Pa/JoyCCQrCDpJNSd7wGzKtZQu4cTZ7QSMs1VBn7Fup/koTpgJs/
         JeWl79AgGjr9YzyoVUJAJar4tOEc6dcr2ieA4YFDsq6ayDFu3C5hTkdm4uoq++Wyu7UA
         HzsliLOduak3y/CD4dx/t8DoofAhEVPX6r/n/XhqVcC98O//FHWNBOaIWiDtIueo+kU7
         jqVP9t5ZySTtMTRpNFGcxtHDoSjPBKDygLfBMGCWkWeYm57wgu1ny+zyS8Dj97ms3fBb
         XMig==
X-Forwarded-Encrypted: i=1; AFNElJ+FiSVEWLQB1lZX/EZsOdPONJ5Fgf7daTuPKR/OzL7yKDQwPSAPQCpn9Tgk3YJO4EldwkpMkA6mRTs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvzBZcQKvG2L1jAPqxa9QAlUDdhKq/7Pm4EH97qZ73CwWF6PTe
	0YNb3XQyABKCvZFyf3Zj71Jood/A1VHGbGEWpsGeJsK0We9hY5BCf5Ao4MT0snlqquE6FWSfEfr
	IBWNkQOZd2yBlB4v7sp8SSzvzy/YZ7gMvvceUWXFPog==
X-Gm-Gg: AeBDieutYfzf8gDglrzZrVzt5XZHYRKQkod9Mo2lTXqodlL0AfjoQoiByn4cQSlGFXA
	wY/wsI4iA2yCzJvRha28cqPERzyPDD5UmvJhrFPPys1MfKsZ5U2547RPPFB0W0/kNJ9a0h2TtuB
	NvYhGk8zKvHE+dnF2rIw1nuKkJxUjyvae8GD0HXpdUbyHocb2haGDtD20qaWvz+k4cvxc67M3KJ
	8896LPvyJSx95vibXMJqjpSY8e7UGc9nBPEyrlRstf5wq89IJxDLtCE349bdPZo4K6VaiPis92O
	uhxoKea/GVmbsJaffCe2+Ddxm96yzDvNUU6RPGw5TLK/E8sCBGz2r/O3ZcmY561EbNEvlqQbEMy
	GuiSHOFW5RKMMBIeKWzDGI5WzMR9nd7O3saBctw==
X-Received: by 2002:a05:6820:4b09:b0:685:2a2d:ccb3 with SMTP id
 006d021491bc7-69998ccaa0emr4080398eaf.20.1778155287744; Thu, 07 May 2026
 05:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260425005916.3321811-1-guoren@kernel.org> <20260425005916.3321811-4-guoren@kernel.org>
 <87wlxhwr8v.ffs@tglx>
In-Reply-To: <87wlxhwr8v.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 7 May 2026 17:31:15 +0530
X-Gm-Features: AVHnY4KEq24Vu_FVNe1O36FY1chK0H9YCsRLUDToEwTAF_X2VUeIt8ykh3nsO4I
Message-ID: <CAAhSdy13JYzqf9mB4zw_NFe1jz9yu3p-JarzUPj7RVK1rmoiMw@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] irqchip/riscv-imsic: Move nr_guest_files to
 per-HART local config
To: Thomas Gleixner <tglx@kernel.org>
Cc: guoren@kernel.org, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, cp0613@linux.alibaba.com, fangyu.yu@linux.alibaba.com, 
	gaohan@iscas.ac.cn, inochiama@gmail.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, me@ziyao.cc, palmer@dabbelt.com, 
	pjw@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_130131_746192_2AC186D8 
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

SGkgVGhvbWFzLAoKT24gV2VkLCBNYXkgNiwgMjAyNiBhdCAxOjQy4oCvQU0gVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBBcHIgMjUgMjAyNiBhdCAw
MDo1OSwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFi
YSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPgo+ID4gV2l0aCB0aGUgcmVj
ZW50IEtWTSBBSUEgcGVyLUhBUlQgSEdFSSBjb252ZXJzaW9uLCB0aGUgZ2xvYmFsCj4gPiBucl9n
dWVzdF9maWxlcyBpcyBubyBsb25nZXIgYXBwcm9wcmlhdGUuIERpZmZlcmVudCBIQVJUcyBpbgo+
ID4gaGV0ZXJvZ2VuZW91cyBTb0NzIG1heSBoYXZlIGRpZmZlcmVudCBudW1iZXJzIG9mIGd1ZXN0
IGludGVycnVwdAo+ID4gZmlsZXMuCj4gPgo+ID4gTW92ZSBgbnJfZ3Vlc3RfZmlsZXNgIGZyb20g
YHN0cnVjdCBpbXNpY19nbG9iYWxfY29uZmlnYCB0bwo+ID4gYHN0cnVjdCBpbXNpY19sb2NhbF9j
b25maWdgLCBhbmQgY29tcHV0ZSBpdCBwZXItQ1BVIGluCj4gPiBpbXNpY19zZXR1cF9zdGF0ZSgp
IGJhc2VkIG9uIHRoZSBhY3R1YWwgTU1JTyBndWVzdCBmaWxlIHJlZ2lvbiBzaXplLgo+ID4KPiA+
IFVwZGF0ZSB0aGUgcmVsYXRlZCBjb21tZW50IHRvIHJlZmxlY3QgdGhhdCBLVk0gbm93IHVzZXMg
dGhlCj4gPiBwZXItSEFSVCB2YWx1ZS4KPiA+Cj4gPiBUaGlzIGVsaW1pbmF0ZXMgdGhlIGxhc3Qg
Z2xvYmFsIGFzc3VtcHRpb24gYWJvdXQgZ3Vlc3QgZmlsZXMgYW5kCj4gPiBjb21wbGV0ZXMgdGhl
IHBlci1IQVJUIGNvbnZlcnNpb24gc2VyaWVzIGZvciBSSVNDLVYgQUlBL0lNU0lDLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4KPiBBc3N1bWluZyB0aGlzIGdvZXMgdGhyb3VnaCB0aGUgcmlzYy12IHRyZWU6
Cj4KPiBBY2tlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+CgpUaGFua3Ms
IEkgd2lsbCB0YWtlIHRoaXMgc2VyaWVzIHRocm91Z2ggS1ZNIFJJU0MtViB0cmVlLgoKUmVnYXJk
cywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
