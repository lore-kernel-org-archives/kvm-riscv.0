Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F4CCD6E4A
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Fmn54uJc2ylckh7Q6+SFeDMXbYx4SpjQ1YjEceYpHI=; b=QwpZBqfXG9YGlR
	jc1Xmlsu5Byzqd5h6oxOxA2QUsE7pHPVJM+xcEv36Cpk+5NLWJ3MqJX8o+encL8iz87kfmIaicW19
	KgMBSzhOl81VvXi5ztox1qQdpG6Cp/cy8g/nkVlDPcV4ArTWGmNSOoX7VGrGVOYno6EEan0NpNhkw
	ZxAj3rOypnjwt4cepdo6WmlaoboDuSwhIORxJSbaHu/t1H+HjpnBqJTM6ttlI4ojnd1gOuJNJghgl
	ugKMBRYozGLi8VbJTY0hKZD5rIsFklqqQgMIcBWPkt1Cl0eVaetp16KReZCl7vgjnqtUERa6pBgKX
	sBYQltrJF2WsEop7L2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgJ5-0000000EVkV-3GgF;
	Wed, 03 Jun 2026 07:46:31 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgJ2-0000000EVjq-2pzg
	for kvm-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:46:30 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-69d7aa0ac18so7819354eaf.0
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780472787; cv=none;
        d=google.com; s=arc-20240605;
        b=V8FL0M43t7ledPOOPq/Eci09/eHdM5Kvbx1X8MsRPFBmOEnHJ7sz2P753nJAAX8tlP
         vAl/c9hB8UTQ0vBffVfnpuQyEcwxO9CkUOqlKR9jgEEEK/iamSl1JrxYNQVJ1beTwzhz
         XRftaNUcBXkSFCPNC98ES2OxR6R4k1KbOLQits1H3WPOwQeeXykG460DJtjm/bYI4Nsc
         zJEFEokGD3/XyEU5+NKjNcTzOFQRbh88FtK7WwnC6WL0ggHT4Tc2f+Q5wm72QSf1fyNd
         1HlTbMdIM0kewftVqBtlu9dcOnAXshYIBXpHCWql92Oek071GFUeh18OTEmkgO+1nYTd
         v2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FlHY9eiKKORvzxUtme3s/BJqGjxsKo0G5TMvkH2vdGc=;
        fh=+i7Tn6q8DGjEKyU/izP4sZyWn2bPGMO/xou/ZLwtfAA=;
        b=H3gDsC5yTIOJxAJ7bWXcU9HbfkALaMcdmbj+VA+deyKIUsJfBBD2tN9vMd3pulSdP+
         wH3dS+8xG+5M9mXgi/nWVkP7LqWt1qQCq+9kgrLhcT6KFr/hVy66wbYfab2fQ6W56/R0
         hpfYEGpDP6/pIvcAlP2DryLjB64+8mCKngVkJ5ueelhcc3Z1WaL8Sjv2/4SYCkoAA3Fj
         aHEAyGzIBSt75skBMU4ksh7WxMwkA7fz5vySLCdK/RKPLg8S5FSN5h8h45YeY09PR5Jk
         Df6Cxx0J7s2igM/mYeBa1f0fjsC81V8rs8WFdCy4BIO9650Xz1xTmAonIRp2djXcm+UP
         HnRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780472787; x=1781077587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlHY9eiKKORvzxUtme3s/BJqGjxsKo0G5TMvkH2vdGc=;
        b=yMdfA573b4Rl+JLvXEfbmzB6r2za4AYrtcbvI22t9Wl8dr71IR5JN+RnOjBh740kC8
         P67bX24xJmRvDmvhX8qX/miWS+ExS43lBQdXBka1/z69XM3pK8MvAlHXvt1w+AiXBUWa
         1kJ0TdGmy2VeFyQg/siS90KAKx1mi54ycHSbipItpe38h5zsdt9dkFO9n5tUBR7f+Nv/
         NMW9wx6oJDKi88vFHTR6JJIIwfnv1EDXN7n/Ibz4ViAsJrzZkFc34Dl+3j/tVzCMJBHC
         HUJTBN5kMD7yraSIRFiiqAy5ch9eWqDgDjZ3tqI663G5+xkUnRFJoX35znDghXy993gh
         MS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472787; x=1781077587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FlHY9eiKKORvzxUtme3s/BJqGjxsKo0G5TMvkH2vdGc=;
        b=CSit5YrS/CTB+6fXgrwVZyJwuxhguiR4sTgYAjy3t4lK25mzWlCAiTsKAlndfNSOcY
         Irp8gLC3xIcDOi8cxd6/keD+vk3A398PhIqz93OTy+kLF2xu3XI1ro9qC09S/0eOTAtS
         Ad+BA1SHl7GTpTOUnBKY2zfQXJ1xzbUk2u5grcBTb/UxD9sEskG7rpiCsEeSl7tACl8g
         9gr6V06DZI9U+0K806yCic2gME8a50liG1u3Yf52n8gPMyknEuV3ZR75yZOgmWJSoiFp
         UOimx4nuGyGG7w9nFvRGlSIi+eNIUHzXYy5xtAidGbrxuKTYcP6NalQ7NIR+ZoHz7g8o
         6bRw==
X-Forwarded-Encrypted: i=1; AFNElJ87bfhuV3ssYBH2NnIHtgTgjxZCLG6CMjzDGpMMChR02/MshzDxpDyaGAo1xfeWeG3+YEEXQKHKgWs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl/NtUdNJYM9FNQ04mrNQcU/wxM6YTGbQALT/ztvIUfemG89kG
	X5Khp00DmjFfQKFyUKjMstL8Ue0tKPMGpNTJ6K/YIEszV9mVagz3jZ9D0bqTAHPLGzASysCZORs
	U84JAYmZMx3Q04Rn9IOAHs9dYSWTMPcs/x5ulybGBMA==
X-Gm-Gg: Acq92OGtYu1pwASN/4c4bU/D+hwScPWsQjBIgfFmT9L/bbBVXd7iPJwzXFV6SBxzwzR
	OxlTBmFHCQu3nx3q1sWZnsX68+6iZ/ztAGGzkVFdhmXBkaihXDARjbMj0r/GAdgXsSw+FHpUQ7w
	wG7g58/HQr9GNOMFTrG9bzYxteoQkDpJQGVekB3SAY1cgxviL9QZl0bsqWuCfTFn6fS1pUmtlbZ
	7OiMAGMB5koevEBYdBilFv4QoNntKYRBrE7Ffp/4Wwa6/n0bgvgFSVL9+uC5951683JmrAfUxoT
	+1vkbY3VwwsxQh7Nw+IeAeDjITQcL7LCgUsLisePuphbP52c2ZC3Oh4sDTXNRTbaDd2JBd1PaIj
	IRWvwZweannNDY1wX+JXd88LiPw7ojTqdWmWhtA==
X-Received: by 2002:a05:6820:a113:b0:67e:eb4:238f with SMTP id
 006d021491bc7-69e47ebb7c2mr1148163eaf.18.1780472787482; Wed, 03 Jun 2026
 00:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260601084336.2601675-1-inochiama@gmail.com> <20260601084336.2601675-5-inochiama@gmail.com>
 <ah1pgb4S-UoSWhC_@inochi.infowork>
In-Reply-To: <ah1pgb4S-UoSWhC_@inochi.infowork>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:16:14 +0530
X-Gm-Features: AVHnY4IXk6Xj-7gKzaesDTTCYZDI9ERPTRAVFn1Ta5l01WccpSIZ_xwI2pHLbD0
Message-ID: <CAAhSdy0ZycwjYrKowzaydKhh=fcEDD9-C6TKmb838s0hq8a2hA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Deepak Gupta <debug@rivosinc.com>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Sergey Matyukevich <geomatsi@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_004628_978164_F376AA2C 
X-CRM114-Status: GOOD (  13.95  )
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

T24gTW9uLCBKdW4gMSwgMjAyNiBhdCA0OjQ24oCvUE0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAwMSwgMjAyNiBhdCAwNDo0MzozMlBN
ICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+ID4gRXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVu
c2lvbiBhcnJheSB0byBhbGxvdyBLVk0gdXNlcnNwYWNlIHRvCj4gPiBkZXRlY3QgYW5kIGVuYWJs
ZSBaaWNmaXNzL1ppY2ZpbHAgZXh0ZW5zaW9ucyBmb3IgR3Vlc3QvVk0uCj4gPgo+ID4gQXNzaXN0
ZWQtYnk6IFl1YW5TaGVuZzpjbGF1ZGUtNC43LW9wdXMKPiA+IENvLWRldmVsb3BlZC1ieTogUXVh
biBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4KPiA+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhv
dSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3Rv
IDxpbm9jaGlhbWFAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oIHwgMiArKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL2lzYS5jICAgICAgICAgICAg
ICB8IDIgKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPgo+IEkg
aGF2ZSBmb3Jnb3QgdG8gYWRkIENTUl9TU1AgdG8gdGhlIGNvbnRleHQsIHdpbGwgYWRkIGluIHRo
ZSBuZXh0Cj4gdmVyc2lvbi4gQnV0IEkgaGF2ZSBhIHNtYWxsIHF1ZXN0aW9uIGZvciBpdDogY291
bGQgSSByZXVzZSB0aGUKPiBnZW5lcmljIHN1YnR5cGUgb3IgdXNlIGEgbmV3IENTUiBzdWJ0eXBl
Pwo+CgpBZGQgYW5vdGhlciBDU1Igc3VidHlwZSBmb3IgWmljZmlzcy4KClJlZ2FyZHMsCkFudXAK
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
