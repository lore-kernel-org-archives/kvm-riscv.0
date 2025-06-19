Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9010AC71159
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 07:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dh8ly8sQDnHuKatGy/JjK+asjhobJeOpg6HIhhMDmsw=; b=lprLuh9Rke2QhD
	RtEY4axqmiprebubTV3xx9GzVPvMQraruWpyb5gxtUpn4PJOpCb8usFxyM7t3BZFCwCFkqZyZkEjC
	trGjmTf2jEcDuAFTWRbtVYWdHvF2WrpgT4+avHmb5qBbrnnsY90u1DzWFLGstGjUKQ/thQyEI/y4t
	05XIPNK6CebqnyVDdjYs1+cQ9bCfGhRgvNXJoZWr5Wp/SpralvlgVo6B5ZLuU61sSLaVP20hT4Jwt
	h4HkbwlGSgUgmXUL2CBYd7q3g33pdC76iL8DVKb9lDV7cQx8Unbfurh+fJA3OsqVYCOr6/Q53uYmn
	/BHErKvDY/0kM3RU+/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9kA-0000000CIii-3Oy8;
	Thu, 19 Jun 2025 07:31:30 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9Ke-0000000CFdL-45P7
	for kvm-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 07:05:10 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3de252f75d7so5289535ab.3
        for <kvm-riscv@lists.infradead.org>; Thu, 19 Jun 2025 00:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750316708; x=1750921508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GslG2eeDA0pr4FM9S7GNW7fv8EFyfyljbaLO6KBfzyY=;
        b=UVnrDOLdy0duMVObMp9utmY4NVhm6W/nWuQk/HLP1WDohB6Qssr+NGupgks92xYpju
         bdpaINQfzAP0eYqDSbxF7uw7Q/B+JGj91fqcaHf6FZ9aaNGLAuzYbnA+af9dZGun+2iH
         Izuxn/7PmJX8Xa1QzgvOgqzf25Pp9f+MWv5ANuY3fYh1bS+C7nxttVY/8JOlv+fkKO14
         PLcg9iSVcCnFrAG+/nbwZqp4X5cCEmDxItwF0JbXnBjqN15V8KVuo/4XbUnSiqHcEbq4
         xg9SNf9L6XNCMkDn1JCN4LidipBIxC7mZKXUaJJgcfn/f7xD10Qxe/4vJk/kmZdSzA1s
         q/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750316708; x=1750921508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GslG2eeDA0pr4FM9S7GNW7fv8EFyfyljbaLO6KBfzyY=;
        b=aoZc+PQT4tmODDcVy/nHqRO1JrF8R4U/bNzspitxVk6r9B+dGjH97tz0Oq1YIUIVz6
         vqv8HkA/ekvDNVU1QwIJsI64106yIWSdn3Vyl/1/8fajHb3d7DNdqtf62RSZ5Jvj4o+p
         vA2dXjOD+NGuj1weGf8GsGCK1fqS2juryUWR2+2NcuAIfbED9hed0W1zc7UXEh8Y56oW
         lHZa+Gop6IO70+1kJ9ATtlmWxusLXL2jx6atrK3XNY0jlGAWKRPM4E2wcQOPBVCrelx8
         Ms/dIwfnTv6Ji1zntim9AAUkKz/j6bwbKePjLqBPgySPt89D6XHTbgTg8YyiUVaCt/KV
         rJFw==
X-Forwarded-Encrypted: i=1; AJvYcCWVgyLczC7y3r/eNzIwVJi9X2eYveqiR66pfYZSOCbdQ/QPO8OAJo8GTg+bzC6qsMJTl5FsfJ8p5Eg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw880okQ/2NWvSE/WgTxYO8Vn6romiUwul+EQvak42t77rCK/Lf
	4y+ZvceBrWwQ9sNU1w1CJbYBEc0xvOYgSW5UC9Ft9s/SFiXdDdHtfY8PFcLrWEkkWeF5ZjSDeWq
	x4s9yi3ANbo0djc5zuBW+ubyHcqpfq2z/Qj7F/nbddA==
X-Gm-Gg: ASbGncubdL4Y8MFUyqrdbTIU2Js+c8T6nHQ55SzwQsNOBjDpzzwEVwelCqdMq72ZXzI
	geDzkqd/L+b8lT9p8o/uEP9z6IgZIQ8EKi+OU0cNBg1DqCDtjQZ6PwtAgYs7zlUOar+DXn2nmrc
	N3PljResF8Oi2ld4u7t/BLSy0kppR4GtDbL+fIWk5Tmg==
X-Google-Smtp-Source: AGHT+IFesrnCeqwqKIL68SxUVLD3mgj0qtgD/fpzVKFlJEEMOp1WCDEd2Y5QAaT59CMI7JPaPJsZyFfBy+1dxA4BYlo=
X-Received: by 2002:a05:6e02:1486:b0:3d9:668c:a702 with SMTP id
 e9e14a558f8ab-3de07c55d0amr214853945ab.9.1750316707660; Thu, 19 Jun 2025
 00:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
 <20250611-352bef23df9a4ec55fe5cb68@orel> <aEmsIOuz3bLwjBW_@google.com>
 <20250612-70c2e573983d05c4fbc41102@orel> <aEymPwNM59fafP04@google.com>
 <CAK9=C2WFA+SDt4MCLj0reQnkkA2kxUmfWhT8HZxjT_DdW8W_rQ@mail.gmail.com> <aFF9ZqbvZZtbUnGt@google.com>
In-Reply-To: <aFF9ZqbvZZtbUnGt@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Jun 2025 12:34:54 +0530
X-Gm-Features: AX0GCFswxnEUivmEVLx0LQAT3Sm2nYe0XKx0hCNHOivGswdHqLkLlXYjQJo09L4
Message-ID: <CAAhSdy26LC0xWisbxx+10mTe=D6cXcePtH8t6=TkzMYso7+jUQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in kvm_riscv_gstage_map()
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	zhouquan@iscas.ac.cn, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_000509_107203_66DEA98D 
X-CRM114-Status: GOOD (  21.54  )
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgODowNuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgSnVuIDE1LCAyMDI1LCBBbnVwIFBh
dGVsIHdyb3RlOgo+ID4gT24gU2F0LCBKdW4gMTQsIDIwMjUgYXQgMzo1OeKAr0FNIFNlYW4gQ2hy
aXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVGh1
LCBKdW4gMTIsIDIwMjUsIEFuZHJldyBKb25lcyB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIEp1biAx
MSwgMjAyNSBhdCAwOToxNzozNkFNIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+
ID4gPiA+ID4gTG9va3MgbGlrZSB5J2FsbCBhbHNvIGhhdmUgYSBidWcgd2hlcmUgYW4gLUVFWElT
VCB3aWxsIGJlIHJldHVybmVkIHRvIHVzZXJzcGFjZSwKPiA+ID4gPiA+IGFuZCB3aWxsIGdlbmVy
YXRlIHdoYXQncyBwcm9iYWJseSBhIHNwdXJpb3VzIGt2bV9lcnIoKSBtZXNzYWdlLgo+ID4gPiA+
Cj4gPiA+ID4gT24gMzItYml0IHJpc2N2LCBkdWUgdG8gbG9zaW5nIHRoZSB1cHBlciBiaXRzIG9m
IHRoZSBwaHlzaWNhbCBhZGRyZXNzPyBPcgo+ID4gPiA+IGlzIHRoZXJlIHlldCBhbm90aGVyIHRo
aW5nIHRvIGZpeD8KPiA+ID4KPiA+ID4gQW5vdGhlciBidWcsIEkgdGhpbmsuICBnc3RhZ2Vfc2V0
X3B0ZSgpIHJldHVybnMgLUVFWElTVCBpZiBhIFBURSBleGlzdHMsIGFuZCBJCj4gPiA+IF9hc3N1
bWVfIHRoYXQncyBzdXBwb3NlZCB0byBiZSBiZW5pZ24/ICBCdXQgdGhpcyBjb2RlIHJldHVybnMg
aXQgYmxpbmRseToKPiA+Cj4gPiBnc3RhZ2Vfc2V0X3B0ZSgpIHJldHVybnMgLUVFWElTVCBvbmx5
IHdoZW4gaXQgd2FzIGV4cGVjdGluZyBhIG5vbi1sZWFmCj4gPiBQVEUgYXQgYSBwYXJ0aWN1bGFy
IGxldmVsIGJ1dCBnb3QgYSBsZWFmIFBURQo+Cj4gUmlnaHQsIGJ1dCBpc24ndCByZXR1cm5pbmcg
LUVFWElTVCBhbGwgdGhlIHdheSB0byB1c2Vyc3BhY2UgdW5kZXNpcmFibGUgYmVoYXZpb3I/Cj4K
PiBFLmcuIGluIHRoaXMgc2VxdWVuY2UsIEtWTSB3aWxsIHJldHVybiAtRUVYSVNUIGFuZCBpbmNv
cnJlY3RseSB0ZXJtaW5hdGUgdGhlIFZNCj4gKGFzc3VtaW5nIHRoZSBWTU0gZG9lc24ndCBtaXJh
Y3Vsb3VzbHkgcmVjb3ZlciBzb21laG93KToKPgo+ICAxLiBCYWNrIHRoZSBWTSB3aXRoIEh1Z2VU
TEJGUwo+ICAyLiBGYXVsdC1pbiBtZW1vcnksIGkuZS4gY3JlYXRlIGh1Z2VwYWdlIG1hcHBpbmdz
Cj4gIDMuIEVuYWJsZSBLVk1fTUVNX0xPR19ESVJUWV9QQUdFUwo+ICA0LiBXcml0ZS1wcm90ZWN0
aW9uIGZhdWx0LCBrdm1fcmlzY3ZfZ3N0YWdlX21hcCgpIHRyaWVzIHRvIGNyZWF0ZSBhIHdyaXRh
YmxlCj4gICAgIG5vbi1odWdlIG1hcHBpbmcuCj4gIDUuIGdzdGFnZV9zZXRfcHRlKCkgZW5jb3Vu
dGVycyB0aGUgaHVnZSBsZWFmIFBURSBiZWZvcmUgcmVhY2hpbmcgdGhlIHRhcmdldAo+ICAgICBs
ZXZlbCwgYW5kIHJldHVybnMgLUVFWElTVC4KClRoZSBnc3RhZ2Vfc2V0X3B0ZSgpIGRvZXMgbm90
IGZhaWwgaW4gYW55IG9mIHRoZSBhYm92ZSBjYXNlcyBiZWNhdXNlIHRoZQpkZXNpcmVkIHBhZ2Ug
dGFibGUgImxldmVsIiBvZiB0aGUgUFRFIGlzIHBhc3NlZCB0byBnc3RhZ2Vfc2V0X3B0ZSgpIGFz
CnBhcmFtZXRlci4gVGhlIC1FRVhJU1QgZmFpbHVyZSBpcyBvbmx5IHdoZW4gZ3N0YWdlX3NldF9w
dGUoKSBzZWVzIGFuCmV4aXN0aW5nIGxlYWYgUFRFIGF0IGEgbGV2ZWwgYWJvdmUgdGhlIGRlc2ly
ZWQgcGFnZSB0YWJsZSBsZXZlbCB3aGljaCBjYW4Kb25seSBvY2N1ciBpZiB0aGVyZSBpcyBzb21l
IEJVRyBpbiBLVk0gZy1zdGFnZSBwcm9ncmFtbWluZy4KCj4KPiBBRkFJQ1QsIGdzdGFnZV93cF9t
ZW1vcnlfcmVnaW9uKCkgZG9lc24ndCBzcGxpdC9zaGF0dGVyL2RlbW90ZSBodWdlcGFnZXMsIGl0
Cj4gc2ltcGx5IGNsZWFycyBfUEFHRV9XUklURS4KPgo+IEl0J3MgZW50aXJlbHkgcG9zc2libGUg
SSdtIG1pc3Npbmcgc29tZXRoaW5nIHRoYXQgbWFrZXMgdGhlIGFib3ZlIHNjZW5hcmlvCj4gaW1w
b3NzaWJsZSBpbiBwcmFjdGljZSwgYnV0IGF0IHRoaXMgcG9pbnQgSSdtIGdlbnVpbmVseSBjdXJp
b3VzIDotKQoKVGhlIC1FRVhJU1QgZmFpbHVyZSBpbiBnc3RhZ2Vfc2V0X3B0ZSgpIGlzIHZlcnkg
dW5saWtlbHkgdG8gaGFwcGVuIGJ1dCBJIHNlZQp5b3VyIHBvaW50IGFib3V0IHVubmVjZXNzYXJp
bHkgZXhpdGluZyB0byB1c2VyIHNwYWNlIHNpbmNlIHVzZXIgc3BhY2UgaGFzCm5vdGhpbmcgdG8g
ZG8gd2l0aCB0aGlzIGZhaWx1cmUuCgpJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIFdBUk4oKSBhbmQg
cmV0dXJuIDAgaW5zdGVhZCBvZiByZXR1cm5pbmcgLUVFWElTVC4KClJlZ2FyZHMsCkFudXAKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
