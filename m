Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9B5F53D69
	for <kvm-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 15:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZtmQvz+WzC+ii+gixSS09SXM3vHuOwo45bPwUMYHiM=; b=rhqWo9cCYWIvx4
	c6YeCqVGH2DtriC7DWvk9/G+sKgeW+Q3D5U9Umcq2rguVDdxdhQVLmlqhlVuEc9AGYGeMrWF769se
	aRbIioQ/G5YTb20Rgnh8aoc4Y7XPNxZiq5075MGKnLAD+GW7oby7YsuUFAtijhWOLJohOq1psqI7f
	MVsCqlLu6mFbH6b7LJdF4+tTctUw225aMYm6CXuvv8u9kATbmUO7MHIJb6ar18ehsMDJ+UQSUXePO
	dInEwiH/423g+38F2hto+vH6WwMOF5pmdXmCKW1yA++pB4Ogte2Uc02qe0SBmo8uwAcjJWOQOReLD
	Vnf0lu3Xt5/plE0P8qkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29mE-00000004K8t-0LcM;
	Mon, 16 Mar 2026 15:22:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29mC-00000004K8C-0JZY
	for kvm-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 15:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Aela138P2UA6HOSTxLhqrmtMIrzMEnb2IdbvAjDcPFg=; b=WSDgAjBh8PGTNv+Dh8uNdUY1Iv
	cwnoXBkXuEm6accM4DwntYz4n1D9QJ2PDZLG8/q45K4H+1bs2N86HbnVtxFQEW+4NKIolGX1UyBiD
	YzOQjM6pdgmFWC1J6Uv+804E5N68gnQ9pUdqyewA6TDgjuGqlVKHUSoGEtSygSweXvGwBSsUA6EFs
	LbNSZkH3C6lXYUUfgarbUTbwQCU8Cgk6/lNPTdT5j1FfAaJ+s/gA3Fe1+2Ba8fEcBXcOvAB/FFdpO
	utfouScyegXSHRU/ytlet8jJogTvOSdkK/PA0bB2e+bwcwZdXU574vXcpxNAW0Sx+Hdv5zyg3ri8L
	vqx1WMEw==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29m7-00000007484-3IdC
	for kvm-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 15:22:38 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so779779066b.2
        for <kvm-riscv@lists.infradead.org>; Mon, 16 Mar 2026 08:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674554; cv=none;
        d=google.com; s=arc-20240605;
        b=Qpe4M6BmBAqwq9YDE/p541MIElS0tNvUn7GOoWeCLYWe469cq7BlAUJn/6f01sIrDL
         SNEMAlsum5qfuuYnsORRDtUuBdEAY09qr6hYzXfOeSgA1Fm/RMN/2u9dbQv4mKI9/TrS
         E2wUPz0Sk5CPRvs8ViQErqThfIEXlJ0H07xOXepbKyv1LZWW/TMxi/BpE4lwaa4L4/S9
         36mi+3yquSZWK/t1Q9vGl52gJNUWH/3rhwC/vZK4w674/hEkMyI0ygRakaO1XuOn0g62
         0nTvXPRLYSKfLfM9N+PNn709kxchXqOwwdchQkL/Yur4Nac2uRgStYCUHhrxG6Yzr7av
         cuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aela138P2UA6HOSTxLhqrmtMIrzMEnb2IdbvAjDcPFg=;
        fh=/asCgYgK8P1HVFlnmGUOi1X8klFuFiUvbY89IMb0x1M=;
        b=NTDJkf1H3jN8GZRM7kWN6JEodmHO4m6NMUP8BmY0GmrMO9MuQmj32h4OBP+05gJe3E
         jrMy2AexDpBo3utQL/1WJN9OWGIDfx20eGQDH1KJdjZkxEvT+sdwpO1NPE33M+zwdbH3
         GYsTiwJk+Hq/9ob71ZQQdvDCBgXJqXJgUHM8vCKL/Sto/04OURxmnnpicWSq1Bzy/ifC
         zLpCzW3crUQDArrPVa07Qe4QtBygrBJ23fwZ05hHKl6oXfIkUHle889s86xNySP4sRw0
         HRXXSPI2iwPr6ihfuxtyM4C2gsd721e7QmuYkqyncNmuJToS9CyDkDPkek7DXDy1V85i
         S5pg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773674554; x=1774279354; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aela138P2UA6HOSTxLhqrmtMIrzMEnb2IdbvAjDcPFg=;
        b=XiJUYhvX2rGGc9HuEe8FMEWRk9JyoI5O6QHGesUVI+X7cwx4WzDfQH7yo+l8EXxaIN
         GLrAz2Uh+bprewpIcYiudfUoblROIZkjBpkGfPLJkLn630/TUcAv3SAHU76tzfslgZek
         MhLlzYcVkgJq72sDEQAe/HXazK0o9L+4VzFfgsP5LdmyGqmg9jBrT/waSHoXbZ8pmd/i
         QAaaA6YVaOgHMqyLCmcvoZLfIIs5fUorPXyjKpaEXiL7Djl0XdCUvpelFqM/fyRiFmZY
         sGx60JuW6MZkJro7pI/yH2Hb6HwbgtB2Yhc4Ol3mfW1aO9E+VcjpSbxcZXOgAbJEYt1c
         SLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674554; x=1774279354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aela138P2UA6HOSTxLhqrmtMIrzMEnb2IdbvAjDcPFg=;
        b=rbmERjuS8XZNcO1xSbgEwwRKNCy2K5GC0mQFAmxv0bFKOpkh+INEka5gjnNhJXaUnd
         zAiAgkOs9/a+/5PcBDc9QtARnIoEJfj9FT31pwr+AtulxDAOv9nkmsyakGxOvCFegjua
         On+ifw4WNh52NudeF2aLdSXZoMJrXLoGYecRfWE6Yozl0ilnWzEbJJ1I+iQ9mD2T+jSw
         iSV655fKBuh4uqGCh701v7HD/jpqGI4eN2b89ghEbUloVXXMBypxjmlFAaZDOEGqJEMX
         9h8HzjuX5x33K55I59wKXretmzfvB1L2/64fW+OQuHGbgdabrp1T6J4E3yAsq2om9SNv
         CjQA==
X-Forwarded-Encrypted: i=1; AJvYcCWaiG28nilVx7v8KNsJy9bl8tIUx61SU95Pd4Xc5dZXdR7vsHodVngNMXwyxtOZ/5Xl4AlIiiQvLNU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYBnlEguUOWQFPSAO6c8btyh9oRjpZeHzZmEQ6cmPyG/q3jTOv
	ULER5/WtypD/+1x4kYoPHiOvjBi7hcL7GfiFwqEWk1ZZnSkAdjAnuF+A3/lbRnkOXFFYqJ2TVXA
	zchk7HsY5Q1svHFRmc6Cvhrq0cLw7M9A=
X-Gm-Gg: ATEYQzyDr0MgJBbzvrmZWylNTAsAprePLG7u5igliIdTOPDSEmQ+T5k4RSSNIWxKGyN
	hDObbAmEo4IkPP6LOBvXceSi4KOUp/U2yC6Ox/NS5kH63V+BhsdHbjqo7MueIIpC3mrdm/Q30ZO
	BIY3WkhIfuaHfRTFydktbxw0D+a+M7pKqDjkvSvxxa0oUzCK4+8AKQIOCMfVl9HmnZGLSj1uhpQ
	slyo2/uB7pppx67pQL8Rc9tCQXDr/xUY0JEzdI6kDKDQsZ5Jn1fcpZW3gn+j7wPWi/3NpZVUVLZ
	F9hTrK4=
X-Received: by 2002:a17:907:94d4:b0:b97:464:9553 with SMTP id
 a640c23a62f3a-b97650d8e72mr936440266b.17.1773674553492; Mon, 16 Mar 2026
 08:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260316151612.13305-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260316151612.13305-1-osama.abdelkader@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Mon, 16 Mar 2026 10:22:21 -0500
X-Gm-Features: AaiRm510yNIk-2AFg7p9AlWX6hUz5FX6ePJRq44wcScAeWIThYKeskTelXRSBP4
Message-ID: <CAFTtA3MXQdQodaurFOz0PneuHEbY2j+yfQyWgqT9gWMBS1cZjQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: kvm: fix vector context allocation leak
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vincent Chen <vincent.chen@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_152235_977117_C27199A1 
X-CRM114-Status: GOOD (  16.78  )
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

SGkgT3NhbWEsCgpUaGFua3MgZm9yIHNwb3R0aW5nIHRoaXMsCgpPbiBNb24sIE1hciAxNiwgMjAy
NiBhdCAxMDoxNuKAr0FNIE9zYW1hIEFiZGVsa2FkZXIKPG9zYW1hLmFiZGVsa2FkZXJAZ21haWwu
Y29tPiB3cm90ZToKPgo+IFdoZW4gdGhlIHNlY29uZCBremFsbG9jIChob3N0X2NvbnRleHQudmVj
dG9yLmRhdGFwKSBmYWlscyBpbgo+IGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0
LCB0aGUgZmlyc3QgYWxsb2NhdGlvbgo+IChndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkgaXMg
bGVha2VkLiBGcmVlIGl0IGJlZm9yZSByZXR1cm5pbmcuCj4KPiBGaXhlczogMGY0YjgyNTc5NzE2
ICgicmlzY3Y6IEtWTTogQWRkIHZlY3RvciBsYXp5IHNhdmUvcmVzdG9yZSBzdXBwb3J0IikKPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IE9zYW1hIEFiZGVsa2Fk
ZXIgPG9zYW1hLmFiZGVsa2FkZXJAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8
YW5keWJuYWNAZ21haWwuY29tPgoKPiAtLS0KPiB2MjoKPiAtIEFkZCBGaXhlczogdGFnCj4gLSBB
ZGQgQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNw
dV92ZWN0b3IuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9y
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4gaW5kZXggMDVmM2NjMmQ4ZTMxLi41
YjZhZDgyZDQ3YmUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMKPiBAQCAtODAsOCArODAsMTEgQEAg
aW50IGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4KPiAgICAgICAgIHZjcHUt
PmFyY2guaG9zdF9jb250ZXh0LnZlY3Rvci5kYXRhcCA9IGt6YWxsb2MocmlzY3Zfdl92c2l6ZSwg
R0ZQX0tFUk5FTCk7Cj4gLSAgICAgICBpZiAoIXZjcHUtPmFyY2guaG9zdF9jb250ZXh0LnZlY3Rv
ci5kYXRhcCkKPiArICAgICAgIGlmICghdmNwdS0+YXJjaC5ob3N0X2NvbnRleHQudmVjdG9yLmRh
dGFwKSB7Cj4gKyAgICAgICAgICAgICAgIGtmcmVlKHZjcHUtPmFyY2guZ3Vlc3RfY29udGV4dC52
ZWN0b3IuZGF0YXApOwo+ICsgICAgICAgICAgICAgICB2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQu
dmVjdG9yLmRhdGFwID0gTlVMTDsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4g
KyAgICAgICB9Cj4KPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gLS0KPiAyLjQzLjAKPgoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
