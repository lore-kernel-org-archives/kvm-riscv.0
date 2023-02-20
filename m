From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 20 Feb 2023 20:24:00 +0100
Subject: [PATCH v4 6/8] RISC-V: Use Zicboz in clear_page when available
In-Reply-To: <ff11ad0f-7ea0-1dd3-32ce-5a28c8816397@codethink.co.uk>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-7-ajones@ventanamicro.com>
 <4a25cf89-bcf0-e78c-a8ab-7ba0c4f8e2bf@codethink.co.uk>
 <b348f0cc-4868-2924-9935-00ec18b36da9@codethink.co.uk>
 <20230217122943.24caosketyvfcc4f@orel>
 <ff11ad0f-7ea0-1dd3-32ce-5a28c8816397@codethink.co.uk>
Message-ID: <20230220192400.ycqqugbrgqyvorqq@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 20, 2023 at 06:43:40PM +0000, Ben Dooks wrote:
> On 17/02/2023 12:29, Andrew Jones wrote:
> > On Fri, Feb 17, 2023 at 10:50:07AM +0000, Ben Dooks wrote:
> > > On 17/02/2023 10:18, Ben Dooks wrote:
> > > > On 09/02/2023 15:26, Andrew Jones wrote:
> > 
> 
> [snip]
> 
> > Hi Ben,
> > 
> > I'll be sending a new version where I don't touch vendor-id anymore, but
> > rather break errata_id into two parts: id and application-data.
> 
> Do you have an idea when v5 will be out, if it is this week I will
> hold-off our internal tree rebase to change to v5.

I'll bump it up in the priority queue and try to send something tomorrow
or Wednesday.

Thanks,
drew

> 
> Thanks!
> 
> -- 
> Ben Dooks				http://www.codethink.co.uk/
> Senior Engineer				Codethink - Providing Genius
> 
> https://www.codethink.co.uk/privacy.html
> 

